var editor;
var l;

$(document).ready(function() {

  $("#close-code-button").click(function(event) {
    $("#code-submit-button").hide();
    $("#close-code-button").hide();
    $("#right-sidebar").css("width", 50);
  })

  saveButtonStartProgress = function() {
    $("#code-submit-button").click();
  }

  openSidebar = function(url, objectClass, objectId, isCodeSubmission) {
    $("#right-sidebar").animate({width: 800});
    $("#code-submit-button").show();
    $("#close-code-button").show();
    editor = ace.edit("code-editor");
    editor.setTheme("ace/theme/github");
    editor.getSession().setUseWrapMode(true);
    editor.setShowPrintMargin(false);
    getSubmission(url, objectClass, objectId, Reveal.getIndices().h, function() {
      session = editor.getSession();
      count = session.getLength();
      console.log(count, session.getLine(count - 1).length);
      editor.gotoLine(count, session.getLine(count-1).length);
    });

    editor.focus();

    editor.on("change", function(event) {
      saveButtonStartProgress();
      saveSubmission(url, objectClass, objectId, Reveal.getIndices().h, editor.getValue(), isCodeSubmission);
    });

    editor.resize();
  }

  getSubmission = function(url, objectClass, objectId, slideIndex, callback) {
    Pace.restart();
    var data = JSON.stringify({
      parent_id: objectId,
      parent_type: objectClass,
      slide_id: slideIndex
    });

    $.ajax({
      type: 'POST',
      url: url + '/resource',
      data: data,
      contentType: "application/json; charset=utf-8",
      dataType: "json",
      success: function(data) {
        editor.setValue(data.content);
        callback();
      },
      failure: function(data) {
        editor.setValue("");
      }
    });
    return false;
  }

  saveSubmission = function(url, objectClass, objectId, slideIndex, text, isCodeSubmission) {
    Pace.restart();
    var data = JSON.stringify({
      parent_id: objectId,
      parent_type: objectClass,
      content: text,
      slide_id: slideIndex,
      is_code_submission: isCodeSubmission
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
