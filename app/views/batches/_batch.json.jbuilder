json.extract! batch, :id, :product_id, :operation_id, :current_operation, :units, :created_at, :updated_at
json.url batch_url(batch, format: :json)
