class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|

      t.string :name,          null: false
      t.string :address,       null: false
      t.string :phone,         null: false
      t.string :closed,        null: false
      t.string :access,       null: false
      t.string :parking,       null: false
      t.string :remarks

      t.integer :first_hour,   null: false
      t.integer :first_min,    null: false
      t.integer :end_hour,     null: false
      t.integer :end_min,      null: false

      t.timestamps
    end
  end
end
