require 'sinatra/base'
require 'sinatra/assetpack'
require 'sinatra/activerecord'
require 'sinatra/content_for'
require 'slim'
require 'redis'
require 'coffee-script'
require 'sass'

require 'dotenv'
Dotenv.load

require_relative 'models/init'

module Oishinbo
  class App < Sinatra::Base
    configure do
      register Sinatra::AssetPack
      register Sinatra::ActiveRecordExtension
      helpers Sinatra::ContentFor
      set :database_file, "config/database.yml"
      set :public_folder, File.dirname(__FILE__) + '/public'
    end

    configure :development do
      require 'sinatra/reloader'
      register Sinatra::Reloader
    end

    helpers do
      #and more...
    end

    get '/' do
      slim :index
    end

    get '/test' do
      @test = Oishinbo::Restaurant.all
      slim :test
    end

    # js and css
    assets do
      serve '/js', :from => 'assets/javascripts'
      js :application, [
        '/js/*.js'
      ]

      serve '/css', :from => 'assets/stylesheets'
      css :applicatin, [
        '/css/*.css'
      ]

      js_compression :jsmin
      css_compression :sass
    end
  end
end
