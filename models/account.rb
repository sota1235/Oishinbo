require "bcrypt"

module Oishinbo
  class Account < ActiveRecord::Base
    include BCrypt

    has_many :account_sections
    has_many :sections, through: :account_sections
    has_many :participants
    has_many :evaluations

    validates :name, {
      presence: {message: '名前が入力されていません'},
      format: {
        with: /\A[^\<\>\*\-\_\!\@\#\$\%\[\]\\\/\;\:\(\)]*\z/,
        on: :create,
        message: ' 名前に入力されている値が不正です'
      }
    }

    validates :email, {
      presence: {message: 'メールアドレスが入力されていません'},
      uniqueness: {message: 'このメールアドレスは既に登録されています'},
      format: {
        with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
        on: :create ,
        message: 'メールアドレスの形式が正しくありません'
      }
    }

    validates :password, {
      presence: {message: 'パスワードが入力されていません'},
      confirmation: {message: 'パスワードが一致しません'}
    }

    validates :password_confirmation, {
      presence: {message: 'パスワード(確認用)が入力されていません'}
    }

    # ハッシュ化されたPasswordをパースして返却するメソッド
    #
    # @return [String] パスワード
    def password
      @password ||= Password.new(password_hash)
    end

    # 与えられた引数をハッシュ化して返すメソッド
    #
    # @param [String] パスワード
    #
    # @return [Account] Accountオブジェクト
    def password=(password)
      @password = ""
      unless password.empty?
        @password = Password.create(password)
      end
      self.password_hash = @password 
    end

    # メールアドレスでユーザーを検索するメソッド
    # 
    # @param [String] Email
    #
    # @return [Account] Accountオブジェクト
    def find_by_email(email)
      account = self.where(email).first
    end

    def find_account_info_by_id(id)
      account_info = self.where
    end
  end
end
