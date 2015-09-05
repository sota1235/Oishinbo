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
require 'json'
require 'dotenv'
Dotenv.load

module Oishinbo
  class GurunaviApi
    def initialize
      @keyid  = ENV['GURUNAVI_API_KEY']
      @format = 'json'
    end

    # serach restaurant by free word
    def search_restaurant_by_fw(fw)
      base_url = 'http://api.gnavi.co.jp/RestSearchAPI/20150630/'
      freeword = fw

      # create request URL
      params = { 'keyid' => @keyid, 'freeword' => freeword, 'format' => @format }
      # GET request
      responce = RestClient.get base_url, {:params => params}
      JSON.parse responce
    end

    # get restaurant's information
    def get_restaurant_info
    end
  end
end
