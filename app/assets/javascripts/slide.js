$(document).ready(function() {
  $.fn.visible = function(partial) {
    var $t        = $(this),
    $w            = $(window),
    viewTop       = $w.scrollTop(),
    viewBottom    = viewTop + $w.height(),
    _top          = $t.offset().top,
    _bottom       = _top + $t.height(),
    compareTop    = partial === true ? _bottom : _top,
    compareBottom = partial === true ? _top : _bottom;
    return ((compareBottom <= viewBottom) && (compareTop >= viewTop));
  };
  var onScroll = $(window).scroll(function(event) {
    $(".slide-from-right").each(function(i, el) {
      if ($(el).visible(true)) {
        $(el).addClass("slide-right");
      }
    });
    $(".slide-from-left").each(function(i, el) {
      if ($(el).visible(true)) {
        $(el).addClass("slide-left");
      }
    });
    $(".fade-from-in").each(function(i, el) {
      if ($(el).visible(true)) {
        $(el).addClass("fade-in");
      }
    });
    $(".slide-from-up").each(function(i, el) {
    });
  });
});
