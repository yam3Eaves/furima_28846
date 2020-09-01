class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :img_url,                 null: false
      t.string :name,                    null: false
      t.text :explanation,               null: false
      t.integer :category,               null: false
      t.integer :condition,              null: false
      t.integer :shipping_charge_bearer, null: false
      t.integer :shipping_area,          null: false
      t.integer :days_untill_shipping,   null: false
      t.integer :price,                  null: false
      t.references :user,                null: false, foreign_key: true


      t.timestamps
    end
  end
end
