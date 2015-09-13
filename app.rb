require 'sinatra/base'
require 'sinatra/assetpack'
require 'sinatra/activerecord'
require 'sinatra/content_for'
require 'sinatra/json'
require 'slim'
require 'redis'
require 'coffee-script'
require 'sass'
require 'rack-flash'

# user defined files
require_relative 'models/init'
require_relative 'services/init'

module Oishinbo
  class App < Sinatra::Base
    enable :sessions
    set :session_secret, 'My session secret'

    configure do
      require 'dotenv'
      Dotenv.load

      register Sinatra::AssetPack
      register Sinatra::ActiveRecordExtension
      helpers Sinatra::ContentFor

      use Rack::Flash
      set :database_file, 'config/database.yml'
      set :public_folder, File.dirname(__FILE__) + '/public'
    end

    configure :development do
      require 'sinatra/reloader'
      register Sinatra::Reloader
    end

    helpers do
      #and more...
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

    # トップページ表示用メソッド
    #
    # @see Oishinbo::App#index
    get '/' do
      if session[:account_id]
        @session = session[:account_id]
      else
        @session = 'hoge'
      end
      slim :index
    end

    # アカウント登録フォーム表示用メソッド
    #
    # @see Oishinbo::App#account_new
    get '/account/new' do
      redirect '/' unless is_login?
      @sections = Section.all
      slim :account_new
    end

    # アカウント登録処理メソッド
    #
    # @param [String]  名前
    # @param [String]  Email
    # @param [String]  パスワード
    # @param [String]  確認用パスワード
    # @param [Integer] 所属部署ID
    #
    # @see Oishinbo::App#index
    # @see Oishinbo::App#account_new
    post '/account/create' do
      account = Account.new do |a|
        a.name = params[:name].strip
        a.email = params[:email]
        a.password = params[:password]
        a.password_confirmation = params[:password_confirmation]
        a.account_sections.build.section_id = params[:section_id]
      end

      if account.save
        session[:account_id] = account.id
        redirect '/'
      else
        flash[:errors] = account.errors.messages
        redirect back
      end
    end

    # ログインページ表示用メソッド
    #
    # @see Oishinbo::App#index
    # @see Oishinbo::App#login
    get '/login' do
      redirect '/' unless is_login?
      slim :login
    end

    # ログイン処理用メソッド
    #
    # @param [String] Email
    # @param [String] パスワード
    #
    # @see Oishinbo::App#index
    # @see Oishinbo::App#login
    post '/login' do
      account = Account.find_by_email(params[:email])
      if account && account.password == params[:password]
        session[:account_id] = account.id
        redirect '/'
      else
        flash[:error] = 'メールアドレス，もしくはパスワードが異なります。'
        flash[:email] = params[:email]
        redirect back
      end
    end

    # ログアウト処理用メソッド
    #
    # @param [Integer] アカウントID
    # 
    # @see Oishinbo::App#index
    post '/logout' do
      redirect '/' unless session[:account_id]

      session.clear
      redirect '/'
    end

    # マイページ
    #
    # @see Oishinbo::App#mypage
    get '/mypage' do
      redirect '/login' unless session[:account_id]
      account = Account.find_info_by_id(session[:account_id])
      slim :mypage
    end

    ### Restaurant API ###

    # serch restaurant
    post '/search/restaurant' do
      gurunavi_api = GurunaviApi.new
      json gurunavi_api.search_restaurant_by_fw params['fw']
    end

    private

    # ログイン判定用メソッド
    #
    # @return [Boolean] true or false
    def is_login?
      session[:account_id].nil? ? true : false
    end
  end
end
