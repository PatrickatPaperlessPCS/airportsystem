class AddRecurrenceToAutomatedTransations < ActiveRecord::Migration
  def change
    add_column :automated_transactions, :recurrence, :string
  end
end
