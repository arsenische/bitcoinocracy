# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

toggleArgument = (x)-> 
  is_negation = $('#signature_negation')
  #  console.log(is_negation.val())
  if (is_negation.val()=='false')
    $('#argument').text($('#con_statement').val())
    $('#toggle_button span').text(' Believe')
    is_negation.val('true')
  else
    $('#argument').text($('#pro_statement').val())
    $('#toggle_button span').text(' Doubt')
    is_negation.val('false')
  $('#signature_signature').val('')

ready = ->
  $('#toggle_button').click ->
    toggleArgument()

$(document).ready(ready)
$(document).on('page:load', ready)

$(document).on "ready page:change", ->

  # Remove all global properties set by addthis, otherwise it won't reinitialize
  for i of window
    delete window[i]  if /^addthis/.test(i) or /^_at/.test(i)
  window.addthis_share = null
  addthis_config = addthis_config || { };
  addthis_config.pubid = 'ra-522e4d0a6ca5be69';

  # Finally, load addthis
  $.getScript "//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-522e4d0a6ca5be69"


  $('.noclick').click () ->
    return false
