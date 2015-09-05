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

dummy = {
	"name" 		  => "寿司屋オイシンボ",
	"name_kana"   => "sushiyaoishinbo",
	"address"     => "wtf",
	"category"    => "寿司",
	"tel"         => "08012345678",
	"latitude"    => 35.65,
	"longitube"   => 139.7,
	"pc_url"      => "http://aboy-perry.hatenablog.com/",
	"mobile_url"  => nil,
	"time_detail" => "年中無休、24時間営業",
	"holiday"     => "毎日がエブリデイ"
}

include Oishinbo
#p = Restaurant.new
#p.register_restaurant(dummy)
p Restaurant.all