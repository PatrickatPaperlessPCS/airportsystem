class AddConnectedToQbToAirports < ActiveRecord::Migration
  def change
    add_column :airports, :connected_to_qb, :boolean
  end
end
