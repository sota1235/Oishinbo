require "bcrypt"

module Oishinbo
  class Account < ActiveRecord::Base
    include BCrypt

    has_many :account_sections
    has_many :sections, through: :account_sections

    validates :name, presence: true

    validates :email, uniqueness: true
    validates :email, presence: true

    validates :password, presence: true
    validates :password, confirmation: true 
    validates :password_confirmation, presence: true

    def password
      @password ||= Password.new(password_hash)
    end

    def password=(password)
      @password = Password.create(password)
      self.password_hash = @password 
    end
  end
end
