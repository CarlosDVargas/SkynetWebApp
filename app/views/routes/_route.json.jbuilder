json.extract! route, :id, :description, :country_id, :created_at, :updated_at
json.url route_url(route, format: :json)
