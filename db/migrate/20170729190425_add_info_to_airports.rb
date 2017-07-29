class AddInfoToAirports < ActiveRecord::Migration
  def change
    add_column :airports, :name, :string
    add_column :airports, :address1, :string
    add_column :airports, :address2, :string
    add_column :airports, :city, :string
    add_column :airports, :state, :string
    add_column :airports, :zip, :string
  end
end
