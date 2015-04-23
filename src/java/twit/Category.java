/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package twit;
import java.util.*;
import twitter4j.*;

/**
 *
 * @author Luqman A. Siswanto
 */
public class Category {
  private ArrayList<String> keys;
  private String category;
  private ArrayList<Status> tweets;
  
  public Category() {
    keys = new ArrayList<String>();
    category = "lala";
    tweets = new ArrayList<Status>();
  }
  public Category(String cat) {
    keys = new ArrayList<String>();
    category = cat;
    tweets = new ArrayList<Status>();
  }
  public Category(String cat, ArrayList<String> keywords) {
    category = cat;
    keys = keywords;
  }
  
  public String getCategory() {
    return category;
  }
  
  public void addKey(String key) {
    keys.add(key);
  }
  public String getKey(int index) {
    return keys.get(index);
  }
  public void removeKey(int index) {
    keys.remove(index);
  }
  public int getKeysSize() {
    return keys.size();
  }
  
  public ArrayList<Status> getTweets() {
    return tweets;
  }
  
  public void addTweets(Status e) {
    tweets.add(e);
  }
}
