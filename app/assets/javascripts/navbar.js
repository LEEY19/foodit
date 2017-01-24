$(document).ready(function(){       
   var scroll_start = 0;
   var startchange = $('.merchant_1');
   var offset = startchange.offset();
   $(document).scroll(function() { 
      scroll_start = $(this).scrollTop();
      if(scroll_start > offset.top) {
          $('#foodie_nav').removeClass('transparent');
          $('.navbar_link').removeClass('foodie_nav_link_1');
          $('.navbar_link').addClass('foodie_nav_link_2');
       } else {
          $('#foodie_nav').addClass('transparent');
          $('.navbar_link').addClass('foodie_nav_link_1');
          $('.navbar_link').removeClass('foodie_nav_link_2');
       }
   });
});