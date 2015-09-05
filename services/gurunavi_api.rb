# gurunavi_api.rb
#
# Description:
#   Class for access to gurunavi API
#
# Author:
#   sota1235

require 'open-uri'
require 'json'
require 'dotenv'
Dotenv.load

module Oishinbo
  class GurunaviApi
    def initialize
      @keyid = ENV['GURUNAVI_API_KEY']
    end

    # serach restaurant by free word
    def search_restaurant_by_fw(fw)
      base_url = 'http://api.gnavi.co.jp/RestSearchAPI/20150630/'
      freeword = fw

      # create request URL
      request_url = "#{base_url}?keyid=#{@keyid}&fw=#{freeword}"
      # GET request
      res = open(request_url)
      JSON.parse res
    end

    # get restaurant's information
    def get_restaurant_info
    end
  end
end
