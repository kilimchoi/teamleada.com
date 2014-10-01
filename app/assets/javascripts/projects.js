//= require reveal
//= require toastr

initializeReveal();

function initializeReveal() {
  // Full list of configuration options available here:
  // https://github.com/hakimel/reveal.js#configuration
  Reveal.initialize({
    maxScale: 10,
    controls: true,
    progress: true,
    history: true,
    backgroundTransition: 'slide',
    transition: 'linear',
    center: true,
    touch: true,
    embedded: true,
    mouseWheel: true,
    transition: 'linear'

    // Optional libraries used to extend on reveal.js
//    dependencies: [
//      { src: 'lib/js/classList.js', condition: function() { return !document.body.classList; } },
//      { src: 'plugin/markdown/marked.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
//      { src: 'plugin/markdown/markdown.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
//      { src: 'plugin/highlight/highlight.js', async: true, callback: function() { hljs.initHighlightingOnLoad(); } },
//      { src: 'plugin/zoom-js/zoom.js', async: true, condition: function() { return !!document.body.classList; } },
//      { src: 'plugin/notes/notes.js', async: true, condition: function() { return !!document.body.classList; } },
//      { src: 'socket.io/socket.io.js', async: true },
//      { src: 'plugin/notes-server/client.js', async: true }
//    ]
  });
}

$(document).ready(function() {
  Reveal.addEventListener('slidechanged', function(event) {
    $("#hidden-slide-id").val(event.indexh);
  });

  $("#hidden-slide-id").val(Reveal.getIndices().h);
});
