class ChangeColumnAccounts < ActiveRecord::Migration
  def change
    change_column :accounts, :profile, :text, null: true
  end
end
