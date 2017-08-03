class AddTokenToAirports < ActiveRecord::Migration
  def change
    add_column :airports, :token, :string
  end
end
