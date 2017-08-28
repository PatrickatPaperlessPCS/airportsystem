class AddEncryptedAcctNumToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :encrypted_account_num, :string
  end
end
