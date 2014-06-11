var editor;

$(document).ready(function() {

  openSidebar = function(url, objectClass, objectId) {
    $("#right-sidebar").css("width", 800);
    editor = ace.edit("code-editor");
    editor.focus();
    editor.setTheme("ace/theme/github");

    editor.on("change", function(event) {
      console.log('changed');
      saveSubmission(url, objectClass, objectId, editor.getValue());
    });
  }

  saveSubmission = function(url, objectClass, objectId, slideId, text) {
    var data = JSON.stringify({
      parent_id: objectId,
      parent_type: objectClass,
      content: text,
      slide_id: slideId
    });

    $.ajax({
      type: 'POST',
      url: url + '/resource-submit',
      data: data,
      contentType: "application/json; charset=utf-8",
      dataType: "json",
      success: function(data) {
        console.log('success');
      },
      failure: function(data) {
        console.log('fail');
      }
    });
    return false;
  }

});
