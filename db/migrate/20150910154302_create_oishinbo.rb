class CreateOishinbo < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.text :profile
      t.string :password_hash, null: false
      t.integer :admin_flag, null: false, default: 0, precision: 1
      t.timestamps
      t.integer :deleted_flag, null: false, default: 0, precision: 1
    end

    create_table :account_sections do |t|
      t.references :account, null: false
      t.references :section, null: false
      t.timestamps
      t.integer :deleted_flag, null: false, default: 0, precision: 1
    end

    create_table :sections do |t|
      t.string :name, null: false
      t.timestamps
      t.integer :deleted_flag, null: false, default: 0, precision: 1
    end

    create_table :wants do |t|
      t.references :account, null: false
      t.references :restaurant, null: false
      t.timestamps
      t.integer :deleted_flag, null: false, default: 0, precision: 1
    end

    create_table :counts do |t|
      t.references :account, null: false
      t.references :restaurant, null: false
      t.integer :counts, default: 0, null: false
      t.timestamps
      t.integer :deleted_flag, null: false, default: 0, precision: 1
    end

    create_table :comments do |t|
      t.references :account, null: false
      t.references :restaurant, null: false
      t.text :comments, null: false
      t.timestamps
      t.integer :deleted_flag, null: false, default: 0, precision: 1
    end

    create_table :restaurants do |t|
      t.string :name
      t.string :name_kana
      t.string :address
      t.string :category
      t.string :tel
      t.float :latitude
      t.float :longitube
      t.string :url
      t.string :url_mobile
      t.text :time_detail
      t.text :holiday
      t.string :shop_image1
      t.string :shop_image2
      t.timestamps
      t.integer :created_by
      t.integer :updated_by
      t.integer :deleted_flag, null: false, default: 0, precision: 1
    end
  end
end
