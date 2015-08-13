
module Oishinbo
  class AccountSection < ActiveRecord::Base
    belongs_to :account
    belongs_to :section
  end
end
