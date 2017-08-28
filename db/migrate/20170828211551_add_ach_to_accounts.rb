class AddAchToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :acct, :string
    add_column :accounts, :routing, :string
  end
end
