class AddQbAccountIdToAirports < ActiveRecord::Migration
  def change
    add_column :airports, :qb_account_id, :string
  end
end
