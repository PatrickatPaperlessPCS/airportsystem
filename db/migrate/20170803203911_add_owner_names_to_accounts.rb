class AddOwnerNamesToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :owner_first_name, :string
    add_column :accounts, :owner_last_name, :string
    add_column :accounts, :company, :string
  end
end
