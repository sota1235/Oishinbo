# -*- coding: utf-8 -*-
# gurunavi_api.rb
#
# Description:
#   Class for access to gurunavi API
#
# Author:
#   sota1235

require 'open-uri'
require 'rest-client'

module Oishinbo
  class GurunaviApi
    Base_host = 'http://api.gnavi.co.jp/'

    def initialize
      @keyid  = ENV['GURUNAVI_API_KEY']
      @format = 'json'
    end

    # serach restaurant by free word
    def search_restaurant_by_fw(fw, offset = 1)
      base_url = Base_host + 'RestSearchAPI/20150630/'
      freewords = fw.split(' ').join ','

      # create request URL
      params = { keyid: @keyid, freeword: freewords, format: @format, offset: offset }
      # GET request
      responce = RestClient.get base_url, {params: params}
      JSON.parse responce
    end

    # get restaurant's information
    def get_restaurant_info
      'hello'
    end
  end
end
