$(document).ready(function() {
  $('#vote-agree').click(function() {
    $('#vote-form').slideDown(300);
    $(this)
    .removeClass('inactive')
    .siblings().addClass('inactive');
  });

  $('#vote-doubt').click(function() {
    $('#vote-form').slideDown(300);
    $(this)
    .removeClass('inactive')
    .siblings().addClass('inactive');
  });
});
