class AddColumnEvaluationFoods < ActiveRecord::Migration
  def change
    add_column :evaluation_foods, :comment, :text 
    add_column :evaluation_foods, :photo, :binary
  end
end
