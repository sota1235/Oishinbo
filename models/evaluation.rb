
module Oishinbo
  class Evaluation < ActiveRecord::Base
    belongs_to :accounts

    has_many :restaurants
    has_many :evaluation_foods
  end
end
