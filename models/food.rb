
module Oishinbo
  class Food < ActiveRecord::Base
    belongs_to :restaurants
    has_many :evaluation_foods
  end
end
