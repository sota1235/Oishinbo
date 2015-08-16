
module Oishinbo
  class AccountSection < ActiveRecord::Base
    belongs_to :account
    belongs_to :section

    validates :section_id, numericality: {only_integer: true, message: '部署の値が不正です'}
  end
end
