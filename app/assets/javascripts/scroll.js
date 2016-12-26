$(document).on("turbolinks:load", function () {

  $("#for_foodie").click(function(e) {
    e.preventDefault();
      $('html,body').animate({
          scrollTop: $(".foodie_section").offset().top},
          'slow');
  });

  $("#for_res").click(function(e) {
    e.preventDefault();
      $('html,body').animate({
          scrollTop: $(".restaurant_section").offset().top},
          'slow');
  });

  $(".heading_1").click(function(e) {
    e.preventDefault();
      $('html,body').animate({
          scrollTop: $(".foodie_section").offset().top},
          'slow');
  });

  $(".heading_2").click(function(e) {
    e.preventDefault();
      $('html,body').animate({
          scrollTop: $(".restaurant_section").offset().top},
          'slow');
  });

  $("#for_contact").click(function(e) {
    e.preventDefault();
      $('html,body').animate({
          scrollTop: $("#contact_us").offset().top},
          'slow');
  });

  $("#for_what_and_how").click(function(e) {
    e.preventDefault();
      $('html,body').animate({
          scrollTop: $(".what_and_how_section").offset().top},
          'slow');
  });
});
