class CreateAutomatedTransactions < ActiveRecord::Migration
  def change
    create_table :automated_transactions do |t|
      t.integer :account_id
      t.string :description
      t.string :long_description
      t.decimal :subtotal
      t.boolean :taxable
      t.decimal :tax
      t.decimal :total
      t.boolean :paid
      t.string :status

      t.timestamps null: false
    end
  end
end
