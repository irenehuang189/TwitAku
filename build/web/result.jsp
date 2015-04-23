<%-- 
    Document   : result
    Created on : Apr 23, 2015, 7:52:22 AM
    Author     : User
--%>

<%@page import="twit.Solver"%>
<%@page import="twit.Category"%>
<%@page import="twitter4j.*"%>

<%@page import="java.util.ArrayList"%>
<%--<%@page import="twit.TwitAku"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>TwitAku - Result</title>
  </head>
  <body>
    <%
      // Daftar kategori untuk setiap topik
      String[] categoryPolicyAndLaw = {"International", "National", "Regional", "Unknown"};
      String[] categoryEntertainment = {"Cinema", "Music", "Gossip", "Unknown"};
      String[] categoryTravelling = {"Place", "Accomodation", "Culinary", "Unknown"};
      String[] categoryTechnology = {"Invention", "Gadget", "Internet", "Unknown"};
      // Permintaan request dari server
      String topic = request.getParameter("topic-choice"); // Topic yang digunakan
      String toSearch = request.getParameter("twitter-search"); // Kata pencarian Twitter
      String[] keywords = { // Keyword pencarian setiap kategori
        request.getParameter("keyword1"),
        request.getParameter("keyword2"),
        request.getParameter("keyword3")
      };
      boolean usingKmp = true; // Algoritma yang digunakan
      // Penentuan kategori sesuai topik
      String[] category = new String[5];
      if (topic.equals("Policy and Law")) {
        //category.clone(categoryPolicyAndLaw);
        category = categoryPolicyAndLaw;
      } else if (topic.equals("Entertainment")) {
      
        category = categoryEntertainment;
      } else if (topic.equals("Travelling")) {
        category = categoryTravelling;
      } else {
        category = categoryTechnology;
      }
      //category.
      //category[category.length] = "Unknown";
      
    %>
    Topic: <%= topic %><br>
    Twitter search: <%= toSearch %><br>
    Kumpulan keyword 1: <%= keywords[0] %><br>
    Kumpulan keyword 2: <%= keywords[1] %><br>
    Kumpulan keyword 3: <%= keywords[2] %><br>
    
    <%
    Solver solver = new Solver(usingKmp, toSearch, keywords, category);
    ArrayList<Category> categories = solver.getOutput();

    // Output berupa list of categories
    for (Category cat : categories) {
      out.println("***** " + cat.getCategory() + " *****<br>");
      ArrayList<Status> l = cat.getTweets();
      for (Status status : l) {
        out.println("@" + status.getUser().getScreenName() + " - " + status.getText());
        String url = "https://twitter.com/" + status.getUser().getScreenName() + "/status/" + status.getId() + "<br>";
        out.println(url);
      }
      out.println("<br>");
    }
    %>
  </body>
</html>
