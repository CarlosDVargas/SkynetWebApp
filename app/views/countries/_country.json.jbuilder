json.extract! country, :id, :name, :icon, :created_at, :updated_at
json.url country_url(country, format: :json)
json.icon url_for(country.icon)
