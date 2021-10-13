json.extract! product, :id, :name, :lowest_price, :image, :description, :stock, :certificate, :artist_id, :created_at, :updated_at
json.url product_url(product, format: :json)
