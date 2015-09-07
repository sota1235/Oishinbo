
module Oishinbo
  class Participant < ActiveRecord::Base
    belongs_to :accounts
    belongs_to :schedules
  end
end
