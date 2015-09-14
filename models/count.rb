
module Oishinbo
  class Count < ActiveRecord::Base
    belongs_to :account
    belongs_to :restaurant

    def self.find_by_account_id(account_id)
      count = self.select(:counts).where(account_id: account_id).first
    end
  end
end
