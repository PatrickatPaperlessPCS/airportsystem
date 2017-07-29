class AddTypeToAirports < ActiveRecord::Migration
  def change
    add_column :airports, :type, :integer
  end
end
