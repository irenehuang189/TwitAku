/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package twit;

import twitter4j.*;
import java.util.ArrayList;

/**
 *
 * @author Luqman A. Siswanto
 */
public class TwitAku {
  
  public static void main(String[] args) {
    // keywords dan knama kategori yang perlu ditambah
    // masukin ke sini.
    boolean usingKmp = true;
    String toSearch = "hello";
    String[] keywords = {
      "wednesday,cinta,nak,hey,cinta,mama",
      "name,papa,berandal,do",
      "world,morning,love"
    };
    String[] kategori = {
      "bola",
      "motogp",
      "table tennis",
      "unknown"
    };
    Solver solver = new Solver(usingKmp, toSearch, keywords, kategori);
    ArrayList<Category> categories = solver.getOutput();

    // Output berupa list of categories
    for (Category cat : categories) {
      System.out.println("***** " + cat.getCategory() + " *****");
      ArrayList<Status> l = cat.getTweets();
      for (Status status : l) {
        System.out.println("@" + status.getUser().getScreenName() + " - " + status.getText());
        String url = "https://twitter.com/" + status.getUser().getScreenName() + "/status/" + status.getId();
        System.out.println(url);
      }
      System.out.println("\n");
    }
  }
}
