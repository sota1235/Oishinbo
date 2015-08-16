require "bcrypt"

module Oishinbo
  class Account < ActiveRecord::Base
    include BCrypt

    has_many :account_sections
    has_many :sections, through: :account_sections

    validates :name, presence: {message: '名前が入力されていません'}

    validates :email, uniqueness: {message: 'このメールアドレスは既に登録されています'}
    validates :email, presence: {message: 'メールアドレスが入力されていません'}
    validates :email, format: {
      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
      on: :create ,
      message: 'メールアドレスの形式が正しくありません'
    }

    validates :password, presence: {message: 'パスワードが入力されていません'}
    validates :password, confirmation: {message: 'パスワード(確認用)が入力されていません'}
    validates :password_confirmation, presence: {message: 'パスワードが一致しません'}

    def password
      @password ||= Password.new(password_hash)
    end

    def password=(password)
      @password = Password.create(password)
      self.password_hash = @password 
    end
  end
end
