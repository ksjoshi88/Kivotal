# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class KIVOTAL.DevTask
  constructor: (@container) ->
    @init()

  init: ->
    @bindEvents()
    unless (@container.find('#task_status').find('option:selected').text() == "assigned")
       @container.find('.developer-selector').hide()

  bindEvents: ->
    @container.find('#task_status').change (event) =>
      @setDeveloper(event)


  setDeveloper:(event) ->
    if($(event.target).find('option:selected').text() == "assigned")
      @container.find('.developer-selector').show()
    else
      @container.find('.developer-selector').hide()
