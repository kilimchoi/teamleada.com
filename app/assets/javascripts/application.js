// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require jquery.remotipart
//= require peek
//= require peek/views/performance_bar
//= require typed
//= require best_in_place
//= require toastr
//= require bootstrap
//= require highcharts
//= require highcharts/highcharts-more
//= require modal
//= require right_sidebar
//= require pace.min
//= require spin.min
//= require ladda.min
//= require ace/ace
//= require ace/theme-github
//= require autocomplete-rails
//= require jquery.countdown
//= require highlight.pack

$(document).ready(function() {
  //load heap data here.
  window.heap=window.heap||[];heap.load=function(a){window._heapid=a;var b=document.createElement("script");b.type="text/javascript",b.async=!0,b.src=("https:"===document.location.protocol?"https:":"http:")+"//cdn.heapanalytics.com/js/heap.js";var c=document.getElementsByTagName("script")[0];c.parentNode.insertBefore(b,c);var d=function(a){return function(){heap.push([a].concat(Array.prototype.slice.call(arguments,0)))}},e=["identify","track"];for(var f=0;f<e.length;f++)heap[e[f]]=d(e[f])};
  heap.load("303778307");

  $(".header-link").click(function(event) {
    event.preventDefault();

    $("ul#header-links li").removeClass("active");
    $(this).parent().addClass("active");
    $('html, body').animate({
      scrollTop: $("#" + $(this).data().element).offset().top - 70
    }, 500);
  });

  loadContent = function() {
    //DEPRECATE: I'm pretty sure this is no longer used - Tristan
    var time = 400;
    var lessons = $(".content-text, .content-code, .content-image, .content-link, .content-video, content-quiz, .individual-step");
    lessons.each(function(index) {
      $(this).delay((time + 150) * index).fadeIn(time);
    });
  }

  loadContent();

  // Best In Place
  $(".best_in_place").best_in_place();

  $(".has-tooltip").tooltip();

  // Ladda
  Ladda.bind('.ladda-button', { timeout: 1000 });

  $("#navbar-toggle").click(function(event) {
    showMobileNavbar();
  });

  $("#close-mobile-navigation").click(function(event) {
    hideMobileNavbar();
  });

  showMobileNavbar = function() {
    $("#mobile-navbar-modal-backdrop").show();
    $("#mobile-navbar-modal-wrapper").show();
  }

  hideMobileNavbar = function() {
    $("#mobile-navbar-modal-backdrop").hide();
    $("#mobile-navbar-modal-wrapper").hide();
  }

  $(".favorite-user").click(function(event) {
    $(this).removeClass("fa-star-o");
    $(this).addClass("fa-star");
  });

  $(".unfavorite-user").click(function(event) {
    $(this).removeClass("fa-star");
    $(this).addClass("fa-star-o");
  });

  $(".js-background-image").css('background-image', function() {
    return "url(" + $(this).data("image-url") + ")";
  });
});
