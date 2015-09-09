
module Oishinbo
  class Food < ActiveRecord::Base
    belongs_to :restaurants
    has_many :evaluation_foods
    has_many :evaluations, throught: :evaluation_foods
  end
end
