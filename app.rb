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
      enable :sessions
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

    get "/account/new" do
      @sections = Section.all
      slim :account_new
    end

    post "/account/create" do
      account = Account.new do |a|
        a.name = params[:name].strip
        a.email = params[:email]
        a.password = params[:password]
        a.password_confirmation = params[:password_confirmation]
        a.account_sections.build.section_id = params[:section_id]
      end

      if account.save
        redirect "/"
      else
        session[:errors] = account.errors.messages
        redirect back
      end
    end
  end
end
