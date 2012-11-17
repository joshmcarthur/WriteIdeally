# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
    $('a.registration-toggle').click (event) ->
        $('.dropdown').removeClass('open')
        $('.registration-dropdown').parent().addClass('open')
        event.stopPropagation()
        event.preventDefault()
