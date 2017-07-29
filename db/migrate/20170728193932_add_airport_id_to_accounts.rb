class AddAirportIdToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :airport_id, :integer
  end
end
