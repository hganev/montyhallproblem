# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('img.door-class').click ->
    $('.selected').removeClass 'selected'
    $(this).addClass 'selected'
    if $('div.switch').css('display') == 'none'
    	$('div.switch').toggle()
    return
  return
