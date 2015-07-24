
require 'sinatra/base'
require 'sinatra/activerecord'
require 'active_record'
#require 'sinatra/activerecord/rake'

require 'slim'
require 'mysql2'
require 'redis'
require 'coffee-script'
require 'sass'

module Oishinbo
  class App < Sinatra::Base
    get '/' do
      slim :index
    end
  end
end
