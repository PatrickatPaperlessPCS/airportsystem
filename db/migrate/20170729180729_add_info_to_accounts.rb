class AddInfoToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :owner, :string
    add_column :accounts, :address1, :string
    add_column :accounts, :address2, :string
    add_column :accounts, :city, :string
    add_column :accounts, :state, :string
    add_column :accounts, :zip, :string
    add_column :accounts, :email, :string
    add_column :accounts, :telephone, :string
  end
end
