json.extract! product, :id, :description, :price, :cost, :created_at, :updated_at
json.url product_url(product, format: :json)
