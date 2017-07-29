class AddPhoneToAirports < ActiveRecord::Migration
  def change
    add_column :airports, :phone, :string
  end
end
