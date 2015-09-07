
module Oishinbo
  class Schedule < ActiveRecord::Base
    has_many :participants
    belongs_to :restaurants
  end
end
