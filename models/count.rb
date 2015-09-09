
module Oishinbo
  class Count < ActiveRecord::Base
    belongs_to :account
    belongs_to :restaurant
  end
end
