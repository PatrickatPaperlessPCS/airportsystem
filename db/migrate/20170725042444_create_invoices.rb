class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :registration
      t.boolean :paid
      t.integer :creator_id
      t.decimal :subtotal
      t.decimal :tax
      t.decimal :total

      t.timestamps null: false
    end
  end
end
