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
  
  // tweets dengan indeks ke-i paralel dengan
  // candidatePlaces dengan indeks ke-i
  
  private ArrayList<Status> tweets;
  // setiap tweet punya array of string buat candidate place
  // karena ada array of tweet, jadinya array of array of string
  private ArrayList<ArrayList<String>> candidatePlaces;
  
  public Category() {
    keys = new ArrayList<String>();
    category = "lala";
    tweets = new ArrayList<Status>();
    candidatePlaces = new ArrayList<ArrayList<String>>();
  }
  public Category(String cat) {
    keys = new ArrayList<String>();
    category = cat;
    tweets = new ArrayList<Status>();
    candidatePlaces = new ArrayList<ArrayList<String>>();
  }
  public Category(String cat, ArrayList<String> keywords) {
    category = cat;
    keys = keywords;
    tweets = new ArrayList<Status>();
    candidatePlaces = new ArrayList<ArrayList<String>>();
  }
  
  public String getCategory() {
    return category;
  }
  
  public ArrayList<String> getKeys() {
    return keys;
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
  
  public void addCandidatePlaces(ArrayList<String> cp) {
    candidatePlaces.add(cp);
  }
  public ArrayList<String> getCandidatePlaces(int i) {
    return candidatePlaces.get(i);
  }
  public ArrayList<ArrayList<String>> getAllCandidatePlaces() {
    return candidatePlaces;
  }
}
