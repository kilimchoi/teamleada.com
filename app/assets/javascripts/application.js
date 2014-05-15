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
//= require best_in_place
//= require toastr
//= require bootstrap

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
    var time = 400;
    var lessons = $(".content-text, .content-code, .content-image, .content-link, .content-video, content-quiz, .individual-step");
    lessons.each(function(index) {
      $(this).delay((time + 150) * index).fadeIn(time);
    });
  }

  loadContent();

  // Best In Place
  $(".best_in_place").best_in_place();

  $('.best_in_place').bind("ajax:success", function(){ alert('Name updated for '+$(this).data('userName')); });

  $('.best_in_place').bind("ajax:error", function() {
    toastr.error('There was an error updating your ' + $(this).data('field') + '.');
  });

});
