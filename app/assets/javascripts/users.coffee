$(document).on "page:change", ->
  $('#moderators-link').click (event) ->
    event.preventDefault()
    $('.moderators-section').fadeToggle()

  $('#users-link').click (event) ->
    event.preventDefault()
    $('.regular-users-section').fadeToggle()
