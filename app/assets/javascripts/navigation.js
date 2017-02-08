$(document).ready(function() {
  $('#univ-hmbgr').click(function() {
    console.log('clicked');
    $('nav.primary').toggleClass('activated');
    $(this).toggleClass('activated');
  });
});
