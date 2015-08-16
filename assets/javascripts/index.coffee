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
  googleMap = null
  $map      = $ '#map_canvas'

  ###
  # Functions
  ###

  # init
  init = () ->
    googleMap = new GoogleMap $map

  ###
  # Event listener
  ###
