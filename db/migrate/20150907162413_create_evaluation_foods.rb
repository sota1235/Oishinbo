class CreateEvaluationFoods < ActiveRecord::Migration
  def change
    create_table :evaluation_foods do |t|
      t.references :evaluation, null: false
      t.references :food, null: false
      t.timestamps
      t.datetime :deleted_at
      t.integer :delete_flag, null: false, default: 0, precision: 1
    end
  end
end
