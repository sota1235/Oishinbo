
require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'active_record'
#require 'sinatra/activerecord/rake'

require 'slim'
require 'mysql2'
require 'redis'
require 'coffee-script'
require 'sass'

module Oishinbo
  class App < Sinatra::Base
    configure :development do
      register Sinatra::Reloader
    end

    helpers do
      #and more...
    end

    get '/' do
      slim :index
    end
  end
end
