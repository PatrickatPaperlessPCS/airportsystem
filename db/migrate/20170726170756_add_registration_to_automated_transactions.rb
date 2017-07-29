class AddRegistrationToAutomatedTransactions < ActiveRecord::Migration
  def change
    add_column :automated_transactions, :registration, :string
  end
end
