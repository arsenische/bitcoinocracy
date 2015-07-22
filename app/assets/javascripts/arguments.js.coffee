# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

toggleArgument = (x)-> 
  is_negation = $('#signature_negation')
  if (is_negation.val()=='0')
    $('#argument').text($('#con_statement').val())
    $('#toggle_button span').text(' Believe')
    is_negation.val('1')
  else
    $('#argument').text($('#pro_statement').val())
    $('#toggle_button span').text(' Doubt')
    is_negation.val('0')
  $('#signature_signature').val('')

ready = ->
  $('#toggle_button').click ->
    toggleArgument()

$(document).ready(ready)
$(document).on('page:load', ready)