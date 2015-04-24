/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
  // Load page choose-topic.html ketika button diklik
  $("#start").click(function(){
    window.location.href = "insert-keyword.jsp";
  });
  // Load page insert-keyword.html ketika button diklik
  $("#choose-topic-button").click(function(){
    //window.location.href = "insert-keyword.html";
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
  
});


