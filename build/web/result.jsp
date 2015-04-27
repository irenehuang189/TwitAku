<%-- 
    Document   : result
    Created on : Apr 23, 2015, 7:52:22 AM
    Author     : User
--%>

<%@page import="twit.Solver"%>
<%@page import="twit.Category"%>
<%@page import="twitter4j.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>TwitAku - Result</title>
    <!-- CSS -->
    <link rel="stylesheet" href="twitter-bootstrap/css/bootstrap.css" type="text/css"/>
    <link rel="stylesheet" href="twitter-bootstrap/css/bootstrap-theme.css" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <link rel="stylesheet" type="text/css" href="css/style-result.css"/>
  </head>
  <body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-default navbar-fixed-top"  role="navigation">
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
    
    // Pencarian twitter
    Solver solver = new Solver(usingKmp, toSearch, keywords, category);
    ArrayList<Category> categories = solver.getOutput();

    // Output berupa list of categories
    for(int i = 0; i < categories.size(); i++) {
      out.println(
        "<div class='container'>" + 
          "<h2 class='result-category'>" + 
              categories.get(i).getCategory() + "</h2><p class='result-tweet-number'>" +
              categories.get(i).getTweets().size() + " tweets found</p>" +
          ""
      );
      
      ArrayList<Status> l = categories.get(i).getTweets();
      for(int j = 0; j < l.size(); j++) {
        String userUrl = "https://twitter.com/" + l.get(j).getUser().getScreenName();
        String statusUrl = userUrl + "/status/" + l.get(j).getId();
        String imageUrl = l.get(j).getUser().getProfileImageURL();
        String oriImageUrl = l.get(j).getUser().getOriginalProfileImageURL() ;
        String placeUrl = "where.html?id-category=" + i + "&id-status=" + j + "&candidate-place=" + categories.get(i).getArrayCanPlaces(j);
        String placeLink = categories.get(i).getArrayCanPlaces(j);
        if (!categories.get(i).getArrayCanPlaces(j).equals("")) {
          placeLink = "Search: " + placeLink;
        }
        out.println(
          "<div class='result-username'>" +
            "<a href='" + oriImageUrl + "' target='blank'>" +  
            "<img src='" + imageUrl + "'/>   " +
            "</a>" +
            "<a href='" + userUrl + "' target='_blank'>" +  
              "@" + l.get(j).getUser().getScreenName() + 
            "</a>" +
            
          "</div>" +

          "<a href='" + statusUrl + "' target='_blank'>" +
            "<div class='result-tweet' id='tweet-" + j + "'>" +
              l.get(j).getText()  +
            "</div>" +
          "</a>" +
          "<div class='result-place'>" +
            "<a href='" + placeUrl +"' target='_blank' style='color:#D22042'>" +
              placeLink +
            "</a>" +
          "</div>"
        );
      }
      if (l.size()==0) {
        out.println("<br>");
      }
      out.println("</div>");
    }
    %>
    <img src="img/bird-blue.png" alt="Help" data-toggle="tooltip" data-placement="top" title="Click on the username to see the user Twitter page" style="width: 100px; position: fixed; left: 160px; top: 300px;">
    <img src="img/bird-yellow.png" alt="Help" data-toggle="tooltip" data-placement="top" title="Click on the place link to see the link in Google Maps!" style="width: 100px; position: fixed; right: 160px; top: 150px;">
    <div class="back-to-top">
      <a href="#index-home">
        <img src="img/icon-home-index.png" alt="Home">
      </a>
    </div>
    <!-- JavaScript -->
    <script src="js/jquery/jquery-1.11.2.js"></script>
    <script src="twitter-bootstrap/js/bootstrap.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true&libraries=places"></script>
    <script src="js/script.js"></script>
  </body>
</html>
