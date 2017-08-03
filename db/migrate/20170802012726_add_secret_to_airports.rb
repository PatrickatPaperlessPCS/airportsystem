class AddSecretToAirports < ActiveRecord::Migration
  def change
    add_column :airports, :secret, :string
    add_column :airports, :realm_id, :string
    add_column :airports, :access_token, :string
    add_column :airports, :access_secret, :string
    add_column :airports, :company_id, :string
  end
end
