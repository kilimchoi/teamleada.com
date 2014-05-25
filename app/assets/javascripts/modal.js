$(document).ready(function () {

  modalPageView = function(url) {
    console.log('modal page view');
    console.log(url);
    ga('send', 'pageview', {
      'page': url + '/modal'
    });
  }

});
