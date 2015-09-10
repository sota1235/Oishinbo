
module Oishinbo
  class Comment < ActiveRecord::Base
    belongs_to :account
    belongs_to :restaurant
  end
end
