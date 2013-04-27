# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  # initialize Gumby
  window.Gumby.init()

  # if AMD return Gumby object to define
  define window.Gumby  if typeof define is "function" and define.amd

  $('.navbar a.toggle').on 'click', (e) ->
    e.preventDefault()
    if $('.navbar ul').hasClass 'active'
      $('.navbar ul').removeClass 'active'
    else
      $('.navbar ul').addClass 'active'