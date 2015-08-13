
module Oishinbo
  class Section < ActiveRecord::Base
    has_many :account_sections
    has_many :accounts, through: :account_sections
  end
end
