<%-- 
    Document   : choose-keyword
    Created on : Apr 23, 2015, 6:42:24 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>TwitAku - Insert Keyword</title>
    <!-- CSS -->
    <link rel="stylesheet" href="twitter-bootstrap/css/bootstrap.css" type="text/css"/>
    <link rel="stylesheet" href="twitter-bootstrap/css/bootstrap-theme.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
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
    
<!--<div id="choose-topic-button">
      
    </div>-->

    <!-- Pilihan topik, kategori, dan keyword -->
    <div class="insert-keyword-form">
      <form autocomplete="on" action="result.jsp">
        <!-- Topik -->
        <div id="topic-choice">
          <label id="topic-choice-label" for="topic-choice">
            Choose your topic
          </label>
          <div class="radio">
          <label>
            <input id="policy-and-law" name="topic-choice" type="radio" value="Policy and Law" checked>Policy and Law
          </label>
          </div>
          <div class="radio">
            <label>
              <input id="entertainment" name="topic-choice" type="radio" value="Entertainment">Entertainment
            </label>
          </div>
          <div class="radio">
            <label>
              <input id="travelling" name="topic-choice" type="radio" value="Travelling">Travelling
            </label>
          </div>
          <div class="radio">
            <label>
              <input id="technology" name="topic-choice" type="radio" value="Technology">Technology
            </label>
          </div>
        </div>
        
        <!-- Kategori dan keyword -->
        <div id="category">
          <h1 id="topic">
            <!-- Diisi melalui JavaScript -->
          </h1>
          <div class="form-group">
            <label id="twitter-search-label" for="twitter-search">
              Twitter Search
            </label>
            <input type="text" class="form-control" name="twitter-search" id="twitter-search" placeholder="Ex. #holiday" required>
          </div>
          <!-- Keyword 1 -->
          <div class="form-group">
            <label id="keyword1-label" for="keyword1">
              <!-- Diisi melalui JavaScript -->
            </label>
            <input type="text" class="form-control" name="keyword1" id="keyword1" placeholder="Ex. World Gas Emition" required>
          </div>
          <!-- Keyword 2 -->
          <div class="form-group">
            <label id="keyword2-label" for="keyword2">
              <!-- Diisi melalui JavaScript -->
            </label>
            <input type="text" class="form-control" name="keyword2" id="keyword2" placeholder="Ex. Presiden Jokowi" required>
          </div>
          <!-- Keyword 3 -->
          <div class="form-group">
            <label id="keyword3-label" for="keyword3">
              <!-- Diisi melalui JavaScript -->
            </label>
            <input type="text" class="form-control" name="keyword3" id="keyword3" placeholder="Ex. Bupati" required><br>
          </div>
          <label for="select-algorithm">
            Algorithm
          </label>
          <select class="form-control" name="select-algorithm" id="select-algorithm">
            <option value="KMP">Knuth-Morris-Pratt (KMP)</option>
            <option value="BM">Boyer-Moore</option>
          </select>
          <p class="help-block">
            Keyword are case-sensitive, seperated by ", ".
          </p>
          <button class="btn btn-default" id="choose-topic-button" type="submit">
            <img src="img/button-search.png">
          </button>
        </div>
      </form>
    </div>

    <!-- JavaScript -->
    <script src="js/jquery/jquery-1.11.2.js"></script>
    <script src="twitter-bootstrap/js/bootstrap.js"></script>
    <script src="js/script.js"></script>
  </body>
</html>
