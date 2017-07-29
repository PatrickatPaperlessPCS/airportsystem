class AddAirportIdToAutomatedTransactions < ActiveRecord::Migration
  def change
    add_column :automated_transactions, :airport_id, :integer
  end
end
