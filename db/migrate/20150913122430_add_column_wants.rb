class AddColumnWants < ActiveRecord::Migration
  def change
    add_column :wants, :display_flag, :integer, default: 1, null: false, limit: 1
    add_reference :counts, :want
  end
end
