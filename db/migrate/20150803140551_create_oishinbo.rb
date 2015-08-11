class CreateOishinbo < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.text :profile, null: false
      t.string :password, null: false
      t.integer :admin_flag, null: false, default: 0, precision: 1
      t.timestamps
      t.datetime :deleted_at
      t.integer :delete_flag, null: false, default: 0, precision: 1
    end

    create_table :account_sections do |t|
      t.references :account, null: false
      t.references :section, null: false
      t.timestamps
      t.datetime :deleted_at
      t.integer :delete_flag, null: false, default: 0, precision: 1
    end

    create_table :sections do |t|
      t.string :name, null: false
      t.timestamps
      t.datetime :deleted_at
      t.integer :delete_flag, null: false, default: 0, precision: 1
    end

    create_table :wants do |t|
      t.references :account, null: false
      t.references :restaurant, null: false
      t.text :comment
      t.timestamps
      t.datetime :deleted_at
      t.integer :delete_flag, null: false, default: 0, precision: 1
    end

    create_table :participants do |t|
      t.references :account, null: false
      t.references :schedule, null: false
      t.timestamps
      t.datetime :deleted_at
      t.integer :delete_flag, null: false, default: 0, precision: 1
    end

    create_table :schedules do |t|
      t.references :restaurant, null: false
      t.datetime :date, null: false
      t.timestamps
      t.datetime :deleted_at
      t.integer :delete_flag, null: false, default: 0, precision: 1
    end

    create_table :restaurants do |t|
      t.string :name
      t.string :name_kana
      t.string :address
      t.string :category
      t.string :tel
      t.float :latitude
      t.float :longitube
      t.string :pc_url
      t.string :mobile_url
      t.text :time_detail
      t.text :holiday
      t.timestamps
      t.datetime :deleted_at
      t.integer :delete_flag, null: false, default: 0, precision: 1
    end

    create_table :evaluations do |t|
      t.references :account, null: false
      t.references :restaurant, null: false
      t.references :food, null: false
      t.text :comment
      t.binary :photo
      t.integer :point, limit: 5, default: 0
      t.timestamps
      t.datetime :deleted_at
      t.integer :delete_flag, null: false, default: 0, precision: 1
    end

    create_table :foods do |t|
      t.references :restaurant, null: false
      t.string :name, null: false
      t.integer :price, null: false
      t.timestamps
      t.datetime :deleted_at
      t.integer :delete_flag, null: false, default: 0, precision: 1
    end
  end
end
