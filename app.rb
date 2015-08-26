require 'sinatra/base'
require 'sinatra/assetpack'
require 'sinatra/activerecord'
require 'sinatra/content_for'
require 'slim'
require 'redis'
require 'coffee-script'
require 'sass'
require 'rack-flash'

require 'dotenv'
Dotenv.load

require_relative 'services/init'

module Oishinbo
  class App < Sinatra::Base
    configure do
      register Sinatra::AssetPack
      register Sinatra::ActiveRecordExtension
      helpers Sinatra::ContentFor
      enable :sessions
      set :database_file, "config/database.yml"
      set :public_folder, File.dirname(__FILE__) + '/public'
    end

    configure :development do
      require 'sinatra/reloader'
      register Sinatra::Reloader

      use Rack::Flash
    end

    helpers do
      #and more...
    end

    get '/' do
      slim :index
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
        flash[:errors] = account.errors.messages
        redirect back
      end
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
