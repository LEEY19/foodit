$(document).on("turbolinks:load", function () {
  $("#pricing_tier_1").click(function() {
    $("#pricing_form_1").submit();
  });
  $("#pricing_tier_2").click(function() {
    $("#pricing_form_2").submit();
  });
  $("#pricing_tier_3").click(function() {
    $("#pricing_form_3").submit();
  });
});