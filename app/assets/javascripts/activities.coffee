# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "page:change", ->
  $('#unapproved-activities').click ->
    $('.unapproved-activities-section').fadeToggle()
    
  $('#approved-activities').click ->
    $('.approved-activities-section').fadeToggle()

  $('#unapp-moderator-activity').click ->
    $('#unapp-mod-act-section').fadeToggle()

  $('#app-moderator-activity').click (event) ->
    event.preventDefault()
    $('#app-mod-act-section').fadeToggle()
