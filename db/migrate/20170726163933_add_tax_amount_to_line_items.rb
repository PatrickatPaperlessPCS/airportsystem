class AddTaxAmountToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :tax_amount, :decimal
  end
end
