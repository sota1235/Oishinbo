
module Oishinbo
  class Restaurant < ActiveRecord::Base
    has_many :wants
    has_many :counts
    has_many :comments
  end
end
