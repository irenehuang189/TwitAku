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
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>TwitAku - Result</title>
    <!-- CSS -->
    <link rel="stylesheet" href="twitter-bootstrap/css/bootstrap.css" type="text/css"/>
    <link rel="stylesheet" href="twitter-bootstrap/css/bootstrap-theme.css" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
  </head>
  <body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-default"  role="navigation">
      <div class="container-fluid">
        <ul class="nav navbar-nav">
          <li>
            <a href="index.html">
              <img src="img/logo-header.png" alt="Logo" style="height:35px">
            </a>    
          </li>
          <li>
            <a href="index.html">
              <img src="img/header-home.png">
            </a>
          </li>
          <li>
            <a href="index.html#index-help">
              <img src="img/header-help.png">
            </a>
          </li>
          <li> 
            <a href="index.html#index-about">
              <img src="img/header-about.png">
            </a>
          </li>
        </ul>
      </div>
    </nav>
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
      String algorithm = request.getParameter("select-algorithm");
      // Penentuan algoritma
      boolean usingKmp = true; // Algoritma yang digunakan
      if (algorithm.equals("KMP")) {
        usingKmp = true;
      } else {
        usingKmp = false;
      }
      // Penentuan kategori sesuai topik
      String[] category = new String[5];
      if (topic.equals("Policy and Law")) {
        category = categoryPolicyAndLaw;
      } else if (topic.equals("Entertainment")) {
        category = categoryEntertainment;
      } else if (topic.equals("Travelling")) {
        category = categoryTravelling;
      } else {
        category = categoryTechnology;
      }
    %>
    Topic: <%= topic %><br>
    Twitter search: <%= toSearch %><br>
    Kumpulan keyword 1: <%= keywords[0] %><br>
    Kumpulan keyword 2: <%= keywords[1] %><br>
    Kumpulan keyword 3: <%= keywords[2] %><br>
    Algoritma: <%= algorithm %><br>
    
    <%
    Solver solver = new Solver(usingKmp, toSearch, keywords, category);
    ArrayList<Category> categories = solver.getOutput();

    // Output berupa list of categories
    for (Category cat : categories) {
      out.println(
              "<div class='container bg-info'>" + 
                "<p class='result-category'>" + 
                    cat.getCategory() + "-<p class='result-tweet-number'>" +
                    cat.getTweets().size() + " tweets found</p>" +
                "</p>"
      );
      
      ArrayList<Status> l = cat.getTweets();
      for (Status status : l) {
        String userUrl = "https://twitter.com/" + status.getUser().getScreenName();
        String statusUrl = userUrl + "/status/" + status.getId();
        out.println(
                "<div class='result-username'>" +
                  "<a href='" + userUrl + "'>" +
                    "@" + status.getUser().getScreenName() + 
                  "</a>" +
                "</div>" +
                
                "<a href='" + statusUrl + "'>" +
                  "<div class='result-tweet'>" +
                    status.getText() +
                  "</div>" +
                "</a>"
        );
      }
      out.println("</div>");
    }
    %>
    <!-- JavaScript -->
    <script src="js/jquery/jquery-1.11.2.js"></script>
    <script src="twitter-bootstrap/js/bootstrap.js"></script>
    <script src="js/script.js"></script>
  </body>
</html>
