class AddColumnAccountIdToInvoicesTable < ActiveRecord::Migration
  def change
    add_reference :invoices, :account, index: true, foreign_key: true
  end
end
