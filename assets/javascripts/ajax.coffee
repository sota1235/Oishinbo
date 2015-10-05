# ajax.coffee
#
# description:
#   wrap ajax process
#
# author:
#   sota1235

class @Ajax
  _url = null

  ### init ###
  constructor: (url) ->
    _url = url

  post : (data) ->
    new Promise (resolve, reject) ->
      $.ajax
        url: _url
        data: data
        success: (res) ->
          if res then resolve res
        error: (req, stat, e) ->
          setTimeout @on_post, 10000
        complete: (e) ->
        type: 'POST'
        timeout: 60000
