json.extract! artist, :id, :name, :email, :social_profile, :webpage, :created_at, :updated_at
json.url artist_url(artist, format: :json)
