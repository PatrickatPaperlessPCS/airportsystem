class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :description
      t.decimal :units_on_hand
      t.decimal :tax_rate
      t.decimal :price

      t.timestamps null: false
    end
  end
end
