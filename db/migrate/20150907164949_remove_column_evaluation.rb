class RemoveColumnEvaluation < ActiveRecord::Migration
  def change
    remove_column :evaluations, :food_id
    remove_column :evaluations, :comment
    remove_column :evaluations, :photo
  end
end
