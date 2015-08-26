class RenameColumnAccountsPassword < ActiveRecord::Migration
  def change
    rename_column :accounts, :password, :password_hash
  end
end
