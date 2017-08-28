class AddEncryptedAcctNumIvToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :encrypted_account_num_iv, :string
  end
end
