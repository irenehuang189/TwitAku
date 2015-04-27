/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
  // Menyalakan fungsi tooltip bootstrap
  $(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip({
        placement : 'top'
    });
  });
  // Load page choose-topic.html ketika button diklik
  $("#start").click(function(){
    window.location.href = "insert-keyword.jsp";
  });
  // Memunculkan form kategori sesuai topik yang dimasukkan
  $("#category").hide();
  $("#topic-choice input:radio").click(function(){
    var category;
    var categoryPolicyAndLaw = ["International", "National", "Regional"];
    var categoryEntertainment = ["Cinema", "Music", "Gossip"];
    var categoryTravelling = ["Place", "Accomodation", "Culinary"];
    var categoryTechnology = ["Invention", "Gadget", "Internet"];
    var printTab;
    if ($(this).is("#policy-and-law")) {
      category = "Policy and Law";
      printTab = categoryPolicyAndLaw;
      $("#twitter-search").attr("placeholder", "E.g. @breakingnews");
      $("#keyword1").attr("placeholder", "E.g. military, crime");
      $("#keyword2").attr("placeholder", "E.g. KAA, Jokowi");
      $("#keyword3").attr("placeholder", "E.g. Bandung, Ridwan Kamil");
    } else if ($(this).is("#entertainment")) {
      category = "Entertainment";
      printTab = categoryEntertainment;
      $("#twitter-search").attr("placeholder", "E.g. #korea");
      $("#keyword1").attr("placeholder", "E.g. Gangnam 1970, the interview");
      $("#keyword2").attr("placeholder", "E.g. kpop, exo");
      $("#keyword3").attr("placeholder", "E.g. lee min ho, suzy");
    } else if ($(this).is("#travelling")) {
      category = "Travelling";
      printTab = categoryTravelling;
      $("#twitter-search").attr("placeholder", "E.g. @dailytraveltips");
      $("#keyword1").attr("placeholder", "E.g. europe, paris, italia, tourism place");
      $("#keyword2").attr("placeholder", "E.g. hotel, discount, book");
      $("#keyword3").attr("placeholder", "E.g. national, best, dessert");
    } else {
      category = "Technology";
      printTab = categoryTechnology;
      $("#twitter-search").attr("placeholder", "E.g. @techreview");
      $("#keyword1").attr("placeholder", "E.g. scientists, ideas, human, new");
      $("#keyword2").attr("placeholder", "E.g. smartphone, Apple, Samsung");
      $("#keyword3").attr("placeholder", "E.g. bandwidth, speed, business");
    }
    $("#topic").text("Topic " + category);
    $("#keyword1-label").text("Keyword " + printTab[0]);
    $("#keyword2-label").text("Keyword " + printTab[1]);
    $("#keyword3-label").text("Keyword " + printTab[2]);
    $("#category").show();
  });
  // Reset form
  $(".reset").click(function(){
    $(this).closest('#insert-keyword-form').find("input[type=text], textarea").val("");
  });
  // Memunculkan alert box ketika tombol submit diklik
  $("#choose-topic-button").click(function(){
    var twitterSearch = $("#twitter-search").val();
    var keyword1 = $("#keyword1").val();
    var keyword2 = $("#keyword2").val();
    var keyword3 = $("#keyword3").val();
    var algorithm = $("#select-algorithm").val();
    var printText = "Word to be search is <b>" + twitterSearch + "</b>.<br>" +
    "The 1th keyword is <b>" + keyword1 + "</b>.<br>" +
    "The 2th keyword is <b>" + keyword2 + "</b>.<br>" +
    "The 3th keyword is <b>" + keyword3 + "</b>.<br>" +
    "Use <b>" + algorithm + "seacrhing algorithm</b>.<br>";
    $("#keyword-form-validation").html(printText);
  });
  // Submit form ketika telah dilakukan validasi data
  $("#insert-keyword-form-confirmation").click(function(){
    $("#insert-keyword-form").submit();
  });
});


