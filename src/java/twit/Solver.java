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
  private static final String[] prefix = {"di", "at", "on", "in"};
  
  private boolean usingKmp;
  private String toSearch;
  private String[] keywords;
  private String[] categoryNames;
  
  private List<Status> tweets = new ArrayList<Status>();
  private ArrayList<Integer> tweetCategory = new ArrayList<Integer>();
  private ArrayList<Integer> index = new ArrayList<Integer>();
  private ArrayList<Category> categories = new ArrayList<Category>();
  
  private String arrayToString(ArrayList<String> arr) {
    String ret = "";
    for(int i = 0; i < arr.size(); i++) {
      if(i != 0) ret += ", ";
      ret += "\"" + arr.get(i) + "\"";
    }
    return ret;
  }
  
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
    generateCandidatePlaces();
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
    for (int k = 0; k < tweets.size(); k++) {
      boolean found = false;
      for (int i = 0; i < categories.size()-1; i++) {
        if(found) break;
        for (int j = 0; j < categories.get(i).getKeysSize(); j++) {
          if(found) break;
          int ind = -1;
          if(usingKmp) {
            ind = algo.exactMatchKmp(categories.get(i).getKey(j), tweets.get(k).getText());
          } else {
            ind = algo.exactMatchBoyerMoore(categories.get(i).getKey(j), tweets.get(k).getText());
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
    for (int i = 0; i < tweets.size(); i++) {
      int indexCategory = tweetCategory.get(i);
      if(indexCategory == -1) {
        indexCategory = categories.size() - 1;
      }
      categories.get(indexCategory).addTweets(tweets.get(i));
    }
  }
  
  private void generateCandidatePlaces() {
    for(Category cat : categories) {
      for(Status tweet : cat.getTweets()) {
        ArrayList<String> candidatePlaces = new ArrayList<String>();
        String text = tweet.getText();
        text = text.replaceAll("[^A-Za-z0-9 ]", " ");
        text = text.replaceAll("\\s+", " ").trim();
        String[] words = text.split(" ");
        ArrayList<Integer> pos = new ArrayList<Integer>();
        for(int i = 0; i < words.length; i++) {
          boolean equal = false;
          for(int j = 0; j < prefix.length && !equal; j++) {
            if(words[i].equals(prefix[j])) {
              pos.add(i);
              equal = true;
            }
          }
        }
        for(int i = 0; i < pos.size(); i++) {
          String place = "";
          int j = pos.get(i) + 1;
          while(j < words.length) {
            if(i + 1 < pos.size() && pos.get(i + 1) <= j) {
              break;
            }
            if(words[j].equals("pic") || words[j].equals("https") || words[j].equals("http")) {
              break;
            }
            if(place.length() != 0) {
              place += " ";
            }
            place += words[j];
            j++;
          }
          if(place.length() != 0) {
            candidatePlaces.add(place);
          }
        }
        cat.addArrayCanPlaces(arrayToString(candidatePlaces));
      }
    }
  }
  
  public ArrayList<Category> getOutput() {
    return categories;
  }
}
