class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.string :description
      t.string :long_description
      t.decimal :price
      t.decimal :units
      t.boolean :tax

      t.timestamps null: false
    end
  end
end
