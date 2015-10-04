# maps.coffee
#
# description:
#   control google maps
#
# author:
#   sota1235

# 実装メモ
#   canvasのDOMオブジェクトを引数にプロトタイプ生成できるようにする
#   APIのいくつかを必要な機能に応じて拡張しつつラップする

module.exports = class @GoogleMap
  # map
  @_canvas   : null
  _map       = null
  _latlng    = new google.maps.LatLng 35.7, 139.0
  _mapOption =
    zoom:   15      # ズーム値
    center: _latlng # 中央の座標
    mapTypeId: google.maps.MapTypeId.ROADMAP
  # marker
  _markers = []

  ### init ###
  constructor: (@canvas) ->
    initMap @canvas

  ### static public method ###
  @makeMarker : (@lat, @lng, @shopName) ->
    # TODO: 新たな店のマーカーを立てる
    _markers.push new google.maps.Marker
      map:       _map
      position : new google.maps.LatLng @lat, @lng
    return null

  ### private method ###
  initMap = (@canvas) ->
    _map = new google.maps.Map @canvas, _mapOption
