require 'yaml'
require 'active_record'

ActiveRecord::Base.configurations = YAML.load_file('./config/database.yml')
ActiveRecord::Base.establish_connection(:development)

module Oishinbo
  class Restaurant < ActiveRecord::Base

  	# 店舗を登録する
  	def register_restaurant(restaurant_info)
  		Restaurant.create(restaurant_info)
  	end

  end
end