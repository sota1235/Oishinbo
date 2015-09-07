
module Oishinbo
  class Food < ActiveRecord::Base
    belongs_to :restaurants
    belongs_to :evalutions
  end
end
