
module Oishinbo
  class Evalution < ActiveRecord::Base
    belongs_to :accounts

    has_many :restaurants
    has_many :foods
  end
end
