class AddAccountClosedToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :account_closed, :boolean, null: false, default: false
  end
end
