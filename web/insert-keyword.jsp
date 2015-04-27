<%-- 
    Document   : choose-keyword
    Created on : Apr 23, 2015, 6:42:24 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>TwitAku - Insert Keyword</title>
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="css/normalize.css"/>
    <link rel="stylesheet" href="twitter-bootstrap/css/bootstrap.css" type="text/css"/>
    <link rel="stylesheet" href="twitter-bootstrap/css/bootstrap-theme.css" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <link rel="stylesheet" type="text/css" href="css/style-insert-keyword.css"/>
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

    <!-- Pilihan topik, kategori, dan keyword -->
    <div class="insert-keyword-form">
      <img src="img/bird-yellow.png" alt="Help" data-toggle="tooltip" data-placement="top" title="Choose the topic" style="width: 100px; position: absolute; left: 270px; top: 200px;">
      <form id="insert-keyword-form" autocomplete="on" action="result.jsp">
        <!-- Topik -->
        <div id="topic-choice">
          <h2 id="topic-choice-label">
            Choose your topic
          </h2>
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
          <img src="img/bird-red.png" alt="Help" data-toggle="tooltip" data-placement="top" title="Fill the form with your keyword!" style="width: 100px; position: absolute; right: 430px; top: 400px;">
          <h2 id="topic">
            <!-- Diisi melalui JavaScript -->
          </h2>
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
          <button class="btn btn-default" id="choose-topic-button" type="submit button" data-toggle="modal" data-target=".bs-example-modal-sm">
            <img src="img/button-search.png">
          </button>
          <button class="btn btn-default reset" type="button">
            Reset
          </button>
          
          <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labeledby="insertKeywordForm" aria-hidden="true">
            <div class="modal-dialog modal-sm">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <h4 class="modal-title" id="exampleModalLabel">Confirmation</h4>
                </div>
                <div class="modal-body" id="keyword-form-validation">
                  <!-- Diisi melalui JavaScript -->
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-primary" id="insert-keyword-form-confirmation">Confirm</button>
                  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </form>
    </div>

    <!-- JavaScript -->
    <script src="js/jquery/jquery-1.11.2.js"></script>
    <script src="twitter-bootstrap/js/bootstrap.js"></script>
    <script src="js/script.js"></script>
  </body>
</html>
