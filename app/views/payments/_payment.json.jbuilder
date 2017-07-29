json.extract! payment, :id, :amount, :source, :created_at, :updated_at
json.url payment_url(payment, format: :json)
