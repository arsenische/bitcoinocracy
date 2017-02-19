$(document).ready(function() {
  $('#vote-agree').click(function() {
    activateButton($(this));
    updateStatement('agree');
  });

  $('#vote-doubt').click(function() {
    activateButton($(this));
    updateStatement('doubt');
  });

  var activateButton = function(button) {
    $('#vote-form').slideDown(300);
    button
    .removeClass('inactive')
    .siblings().addClass('inactive');
  }

  var updateStatement = function(statement) {
    var newStatement;
    switch(statement) {
      case 'agree':
        newStatement = $('#pro_statement').val();
        $('#signature_negation').val('false');
        break;
      case 'doubt':
        newStatement = $('#con_statement').val();
        $('#signature_negation').val('true');
        break;
      default:
        newStatement = '';
    }
    $('#argument-statement').html(newStatement);
  }
});
