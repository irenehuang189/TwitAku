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
    boolean usingKmp = false;
    String toSearch = "at bandung";
    String[] keywords = {
      "the avengers,captain america",
      "asdf,        fdfd, dfsdf",
      "percobaan"
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
      for(String keyword : cat.getKeys()) {
        System.out.println(keyword);
      }
      ArrayList<Status> l = cat.getTweets();
      for(int i = 0; i < l.size(); i++) {
        System.out.println("@" + l.get(i).getUser().getScreenName() + " - " + l.get(i).getText());
        String url = "https://twitter.com/" + l.get(i).getUser().getScreenName() + "/status/" + l.get(i).getId();
        System.out.println(url);
        for(String place : cat.getCandidatePlaces(i)) {
          System.out.println(place);
        }
        System.out.println();
      }
      System.out.println("\n");
    }
  }
}
