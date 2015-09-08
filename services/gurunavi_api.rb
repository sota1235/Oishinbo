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
    Base_host     = 'http://api.gnavi.co.jp/'
    RestSearchAPI = 'RestSearchAPI/20150630/'

    def initialize(format = 'json')
      @params = {
        keyid: ENV['GURUNAVI_API_KEY'],
        format: 'json'
      }
    end

    # serach restaurant by free word
    def search_restaurant_by_fw(fw, offset = 1)
      base_url = Base_host + RestSearchAPI
      freewords = fw.split(' ').join ','

      # create request URL
      params = @params.merge({
        freeword: freewords,
        offset: offset
      })

      JSON.parse request base_url, params
    end

    # get restaurant's information
    def get_restaurant_info_by_id(id)
      base_url = Base_host + RestSearchAPI

      # create request URL
      params = @params.merge({ id: id })

      JSON.parse request base_url, params
    end

    private

    # send GET request and return responce
    def request(base_url, params)
      RestClient.get base_url, { params: params }
    end
  end
end
