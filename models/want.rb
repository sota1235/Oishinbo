
module Oishinbo
  class Want < ActiveRecord::Base
    belongs_to :account
    belongs_to :restaurant
    has_one :count

    def self.find_by_account_id(account_id)
      wants = self.joins(:restaurant,:count).where(account_id: account_id)
    end
  end
end
