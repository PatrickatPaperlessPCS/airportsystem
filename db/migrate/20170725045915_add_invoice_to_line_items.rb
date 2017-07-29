class AddInvoiceToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :invoice, :integer
  end
end
