# index.coffee
#
# description:
#   for index page (main map page)
#
# author:
#   sota1235

$         = require 'jquery'
GoogleMap = require './maps'

$ ->
  ###
  # Variable
  ###
  $map      = $('#map_canvas')[0]
  googleMap = new GoogleMap $map

  ###
  # Functions
  ###
  searchResult = (val) ->
    $('#search-result').text val

  ###
  # Event listener
  ###

  # search restaurant by free word
  $('#search-submit').click ->
    $.ajax
      url: '/search/restaurant'
      type: 'POST'
      data:
        fw: $('#search-fw').val()
      success: (msg) ->
        searchResult JSON.stringify msg
      error: (msg) ->
        searchResult "Error: #{msg}"
      timeout: 5000
