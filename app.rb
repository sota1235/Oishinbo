require 'sinatra/base'
require 'sinatra/activerecord'
require 'slim'
require 'redis'
require 'coffee-script'
require 'sass'

require_relative 'models/init'

module Oishinbo
  class App < Sinatra::Base
    configure do
      register Sinatra::ActiveRecordExtension 
      set :database_file, "config/database.yml"
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
  end
end
