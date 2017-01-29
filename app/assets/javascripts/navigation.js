$(document).ready(function() {
  console.log('ready');
  $('#univ-hmbgr').click(function() {
    console.log('clicked');
    $('nav.primary').toggleClass('activated');
    $(this).toggleClass('activated');
  });
});
