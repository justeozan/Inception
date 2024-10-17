
$(".dropdown-trigger").dropdown();

$(document).ready(function(){
    $('.parallax').parallax();
  });

  $('.carousel.carousel-slider').carousel({
    fullWidth: true,
  });

$(window).scroll(function(){
  if ($(this).scrollTop() > 1){ 
      $('nav').addClass("sticky");
    }
    else{
      $('nav').removeClass("sticky");
    }
});



// CAROUSEL ---------------------------

//  BOUTON NEXT PREV
$(document).ready(function () {
  $('.carousel.but1').carousel();

  $('#prev').click(function() {
    $('.carousel.carousel-slider').carousel('prev');
  });
  $('#next').click(function() {
    $('.carousel.carousel-slider').carousel('next');
  });
});

//   MODAL
$(document).ready(function(){
  $('.modal').modal();
});

// CAROUSEL ----------------------------



function myFunction() {
  $("html").toggleClass("dark");
  $("body").toggleClass("dark"); 
  $("nav").toggleClass("dark");
  $("h2").toggleClass("dark"); 
  $("footer").toggleClass("dark");  
  $("i.fa-brands").toggleClass("dark");
  $("a#prev").toggleClass("dark");
  $("a#next").toggleClass("dark");
  $("a.about-me").toggleClass("dark");
}

function reverse(){
  $("body").css("transform","rotate(180deg)")
}

AOS.init();