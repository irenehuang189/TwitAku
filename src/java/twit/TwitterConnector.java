/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package twit;

import twitter4j.*;
import twitter4j.conf.*;
import java.util.List;

/**
 *
 * @author Devina
 */
public class TwitterConnector {
  private Query query;
  private Twitter twitter;
  List<Status> tweets;
  
  /**
   * Default konstruktor
   */
  public TwitterConnector() {
    ConfigurationBuilder cb = new ConfigurationBuilder();
    
    cb.setDebugEnabled(true)
      .setOAuthConsumerKey("EGisMj2osHyIrjSzFAOez9xPh")
      .setOAuthConsumerSecret("NvuqjYKYxUiYonAYbnnYLk3gJanf229nmAGXhV3YBsJewx2JJa")
      .setOAuthAccessToken("1675728624-aayjWcvZq7ESXsAlX8LuqOdSbN06QKlTMLN38Cp")
      .setOAuthAccessTokenSecret("34XQ2OBsDmYzbecH4Cz8gwtSA0BgejqxSXzVHiPsvVX9B");
    TwitterFactory tf = new TwitterFactory(cb.build());
    twitter = tf.getInstance();
  }
  
  public String getTweetText(int i) {
    return tweets.get(i).getText();
  }
  
  public String getTweetUrl(int i) {
    String url = "https://twitter.com/" + tweets.get(i).getUser().getScreenName() + "/status/" + tweets.get(i).getId();
    return url;
  }
  
  /**
   * Mencari tweet yang mengandung keyword tertentu
   * @param n merupakan jumlah tweet terbaru
   * @param keyword merupakan kata kunci yang ingin dicari
   * @return List yang mengandung keyword
   */
  public List<Status> searchKeyword(int n, String keyword) {
    try {
      query = new Query(keyword);
      query.setCount(n);
      QueryResult result;
      result = twitter.search(query);
      tweets = result.getTweets();
      
      
    } catch (TwitterException te) {
        te.printStackTrace();
        System.out.println("Failed to search tweets: " + te.getMessage());
    }
    return tweets;
  }
}
