class AddAirportIdToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :airport_id, :integer
  end
end
