json.extract! automated_transaction, :id, :account_id, :description, :long_description, :subtotal, :taxable, :tax, :total, :paid, :status, :created_at, :updated_at
json.url automated_transaction_url(automated_transaction, format: :json)
