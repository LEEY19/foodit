$(document).on("turbolinks:load", function () {

  $("#sign_up_for_beta").click(function(e) {
    e.preventDefault();
      $('html,body').animate({
          scrollTop: $(".merchant_3").offset().top - 50},
          'slow');
  });

  $(".foodies_1_btn").click(function(e) {
    e.preventDefault();
      $('html,body').animate({
          scrollTop: $(".features").offset().top - 50},
          'slow');
  });

  $(".merchant_1_btn").click(function(e) {
    e.preventDefault();
      $('html,body').animate({
          scrollTop: $(".features").offset().top - 50},
          'slow');
  });

  $("#features").click(function(e) {
    e.preventDefault();
      $('html,body').animate({
          scrollTop: $(".features").offset().top - 50},
          'slow');
  });
});