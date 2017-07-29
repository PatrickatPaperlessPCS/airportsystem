json.extract! inventory, :id, :description, :units_on_hand, :tax_rate, :price, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
