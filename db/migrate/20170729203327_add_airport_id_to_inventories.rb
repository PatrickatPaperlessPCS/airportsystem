class AddAirportIdToInventories < ActiveRecord::Migration
  def change
    add_column :inventories, :airport_id, :integer
  end
end
