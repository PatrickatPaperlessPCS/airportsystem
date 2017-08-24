class AddQuickbooksCustomerIdToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :quickbooks_customer_id, :string
  end
end
