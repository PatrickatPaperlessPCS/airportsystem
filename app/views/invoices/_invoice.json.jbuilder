json.extract! invoice, :id, :registration, :paid, :creator_id, :subtotal, :tax, :total, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
