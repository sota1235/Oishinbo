
module Oishinbo
  class Account < ActiveRecord::Base
    has_many :account_sections
    has_many :sections, through: :account_sections

    validates :name, presence: true

    validates :email, uniqueness: true
    validates :email, presence: true

    validates :password, presence: true
    validates :password, confirmation: true 
    validates :password_confirmation, presence: true
  end
end
