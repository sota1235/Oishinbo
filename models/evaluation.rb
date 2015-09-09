
module Oishinbo
  class Evaluation < ActiveRecord::Base
    belongs_to :accounts

    has_many :restaurants
    has_many :evaluation_foods
    has_many :foods, throught: :evaluation_foods
  end
end
