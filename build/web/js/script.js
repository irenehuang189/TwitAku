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
  $(".category").hide();
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
    } else if ($(this).is("#entertainment")) {
      category = "Entertainment";
      printTab = categoryEntertainment;
    } else if ($(this).is("#travelling")) {
      category = "Travelling";
      printTab = categoryTravelling;
    } else {
      category = "Technology";
      printTab = categoryTechnology;
    }
    $("#topic").find("h1").text("Topic " + category);
    $("#keyword1-label").text("Keyword " + printTab[0]);
    $("#keyword2-label").text("Keyword " + printTab[1]);
    $("#keyword3-label").text("Keyword " + printTab[2]);
    $("#category").show();
  });
  
});


