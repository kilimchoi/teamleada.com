var editor;

$(document).ready(function() {

  openSidebar = function(url, objectClass, objectId) {
    $("#right-sidebar").css("width", 800);
    editor = ace.edit("code-editor");
    editor.focus();
    editor.setTheme("ace/theme/github");

    editor.on("change", function(event) {
      saveSubmission(url, objectClass, objectId, Reveal.getIndices().h, editor.getValue());
    });
  }

  saveSubmission = function(url, objectClass, objectId, slideIndex, text) {
    Pace.restart();
    var data = JSON.stringify({
      parent_id: objectId,
      parent_type: objectClass,
      content: text,
      slide_index: slideIndex
    });

    $.ajax({
      type: 'POST',
      url: url + '/resource-submit',
      data: data,
      contentType: "application/json; charset=utf-8",
      dataType: "json",
      success: function(data) {

      },
      failure: function(data) {

      }
    });
    return false;
  }

});
