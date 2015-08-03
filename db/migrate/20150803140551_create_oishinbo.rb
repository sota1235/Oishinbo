class CreateOishinbo < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.text :profile, null: false
      t.string :password, null: false
      t.references :section, null: false
      t.integer :admin_flag, null: false, default: 0, precision: 1
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
      t.text :opentime
      t.text :holiday
      t.timestamps
      t.datetime :deleted_at
      t.integer :delete_flag, null: false, default: 0, precision: 1
    end

    create_table :evaluations do |t|
      t.references :account, null: false
      t.references :restaurant, null: false
      t.string :food
      t.integer :price
      t.text :comment
      t.binary :photo
      t.integer :evalution, limit: 5, default: 0
      #t.references :companion
      t.timestamps
      t.datetime :deleted_at
      t.integer :delete_flag, null: false, default: 0, precision: 1
    end

    create_table :wants do |t|
      t.references :account
      t.references :restaurant
      t.text :comment
      t.timestamps
      t.datetime :deleted_at
      t.integer :delete_flag, null: false, default: 0, precision: 1
    end

    #create_table :companions do |t|
    #  t.timestamps
    #end
  end
end
