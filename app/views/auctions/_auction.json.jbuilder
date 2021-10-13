json.extract! auction, :id, :start, :end, :round, :product_id, :created_at, :updated_at
json.url auction_url(auction, format: :json)
