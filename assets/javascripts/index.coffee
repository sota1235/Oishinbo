# index.coffee
#
# description:
#   for index page (main map page)
#
# author:
#   sota1235

$ ->
  ###
  # Variable
  ###
  $map      = $('#map_canvas')[0]
  googleMap = new GoogleMap $map
  url       = location.protocol + '//' + location.host

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
    ajax = new Ajax url + '/search/restaurant'
    ajax.post fw: $('#search-fw').val()
      .then (result) ->
        searchResult JSON.stringify result
      .catch (error) ->
        searchResult "Error: #{error}"
