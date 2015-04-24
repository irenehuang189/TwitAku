/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package twit;

import twitter4j.*;
import java.util.List;
import java.util.ArrayList;

/**
 *
 * @author Luqman A. Siswanto
 */
public class Solver {
  private static String delimiter = ",\\s*";
  private static final int tweetCount = 100;
  
  private boolean usingKmp;
  private String toSearch;
  private String[] keywords;
  private String[] categoryNames;
  
  private List<Status> tweets = new ArrayList<Status>();
  private ArrayList<Integer> tweetCategory = new ArrayList<Integer>();
  private ArrayList<Integer> index = new ArrayList<Integer>();
  private ArrayList<Category> categories = new ArrayList<Category>();
  
  public Solver() {
    
  }
  public Solver(boolean _usingKmp, String _toSearch, String[] _keywords, String[] _kategori) {
    usingKmp = _usingKmp;
    toSearch = _toSearch;
    keywords = _keywords;
    categoryNames = _kategori;
    init();
    crawlingTwitter();
    categorize();
    entry();
  }
  
  /**
   * Ngelakuin parsing
   * @param keywords
   * @param categoryNames 
   */
  private void init() {
    /* Parsing */
    for(int i = 0; i < categoryNames.length; i++) {
      String[] keys = new String[0];
      if(i < keywords.length) {
        keys = keywords[i].split(delimiter);
      }
      categories.add(new Category(categoryNames[i]));
      for(int j = 0; j < keys.length; j++) {
        categories.get(i).addKey(keys[j]);
      }
    }
  }
  
  /**
   * Crawling tweets from twitter
   */
  private void crawlingTwitter() {
    TwitterConnector twit = new TwitterConnector();
    tweets = twit.searchKeyword(tweetCount, toSearch);
    /*
    for (int j = 0; j < tweetCount; j++) {
      System.out.println("@" + tweets.get(j).getUser().getScreenName() + " - " + tweets.get(j).getText());
      String url = "https://twitter.com/" + tweets.get(j).getUser().getScreenName() + "/status/" + tweets.get(j).getId();
      System.out.println(url);
    }
    System.out.println(); */
    
  }
  
  /**
   * Pengelompokkan tweets berdasarkan kategorinya
   */
  private void categorize() {
    Algorithm algo = new Algorithm();
    for (int k = 0; k < tweetCount; k++) {
      boolean found = false;
      for (int i = 0; i < categories.size()-1; i++) {
        if(found) break;
        for (int j = 0; j < categories.get(i).getKeysSize(); j++) {
          if(found) break;
          int ind = -1;
          if(usingKmp) {
            ind = algo.matchKmp(categories.get(i).getKey(j), tweets.get(k).getText());
          } else {
            ind = algo.matchBoyerMoore(categories.get(i).getKey(j), tweets.get(k).getText());
          }
          
          if (ind != -1) {
            tweetCategory.add(i);
            index.add(ind);
            found = true;
            break;
          }
        }
      }
      if (!found) {
        tweetCategory.add(-1);
        index.add(-1);
      }
    }
//    System.out.println(tweetCategory.toString());
//    System.out.println(index.toString());
  }
  
  /**
   * Memasukkan tweet ke dalam kategorinya
   */
  private void entry() {
    for (int i = 0; i < tweetCount; i++) {
      int indexCategory = tweetCategory.get(i);
      if(indexCategory == -1) {
        indexCategory = categories.size() - 1;
      }
      categories.get(indexCategory).addTweets(tweets.get(i));
    }
  }
  
  public ArrayList<Category> getOutput() {
    return categories;
  }
}
