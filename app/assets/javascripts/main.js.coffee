# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$ ->
  # initialize Gumby
  window.Gumby.init()
  init_csrf()

  # if AMD return Gumby object to define
  define window.Gumby  if typeof define is "function" and define.amd

  $('.navbar a.toggle').on 'click', (e) ->
    e.preventDefault()
    if $('.navbar ul').hasClass 'active'
      $('.navbar ul').removeClass 'active'
    else
      $('.navbar ul').addClass 'active'


  $('.talk').on 'click', '.add', (e) ->
    e.preventDefault()
    talk = $(@).data('talk')
    time = $(@).data('time')
    day =  $(@).data('day')
    event_type = $(@).data('type')
    room = $("##{talk} .room").first().text()
    event = $("##{talk} .title").first().text()
    speaker = $("##{talk} .speaker").first().text()
    params = { session: { time: time, room: room, event: event, speaker: speaker, event_type: event_type, day: day, custom_id: talk }}

    $.post '/my_schedule.json', params, (data) =>
      if data.error
        $('#error').html(data.error).show();
      if data.success
        $("#done").html(data.success).show();
        $(@).text('Remove')
        $(@).removeClass('secondary').addClass('danger')
        $(@).removeClass('add').addClass('remove')

      remove_alert()


  $('.talk').on 'click', '.remove', (e) -> 
    e.preventDefault()
    talk = $(@).data('talk')
    $.ajax
      url: "/my_schedule/#{talk}.json"
      type: "DELETE"
      success: (data) =>
        $(@).text('Add')
        $(@).removeClass('danger').addClass('secondary')
        $(@).removeClass('remove').addClass('add')
        $(".my_#{talk}").remove()


  remove_alert()


 remove_alert = -> 
  setTimeout (->
    $(".alert.success").hide('slow')
  ), 5000



init_csrf = ->
  token = $('meta[name="csrf-token"]').attr 'content'

  $.ajaxSetup
    beforeSend: (xhr) ->
      xhr.setRequestHeader "X-CSRF-Token", token