class AddTaxRateToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :tax_rate, :decimal
  end
end
