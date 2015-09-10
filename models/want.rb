
module Oishinbo
  class Want < ActiveRecord::Base
    belongs_to :account
    belongs_to :restaurant
  end
end
