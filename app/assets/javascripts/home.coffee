# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class KIVOTAL.ManagerHome
  constructor: (@container) ->
    @init()
    google.charts.load("current", {packages:["corechart"]});

  init: ->
    @bindEvents()

  bindEvents: ->
    @container.find('#project-id-selector').change (event) =>
      @getProjectStatus($(event.target).val(),$(event.target).find('option:selected').text())

  getProjectStatus:(projectId, projectTitle) =>
    unless projectId == ""
      $.ajax
        type: "GET"
        url: '/get_project_status/' + projectId
        success: (data) =>
          @drawChart(data, 'Project Status - ' + projectTitle)
        error: (data) =>
          alert(data)
    return

  drawChart:(projectData, chartTitle) =>
    projectData.unshift(['Tasks','Count'])
    data = google.visualization.arrayToDataTable(projectData)
    options = {
      title: chartTitle,
      is3D: true,
    }
    chart = new google.visualization.PieChart(document.getElementById('project-status'))
    chart.draw(data, options)
