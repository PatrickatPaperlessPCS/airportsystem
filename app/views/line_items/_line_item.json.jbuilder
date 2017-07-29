json.extract! line_item, :id, :description, :long_description, :price, :units, :tax, :created_at, :updated_at
json.url line_item_url(line_item, format: :json)
