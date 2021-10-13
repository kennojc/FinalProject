class Product < ApplicationRecord
  belongs_to :artist
  has_and_belongs_to_many :types
  has_many :auctions
  has_many :user_products
  has_many :users, through: :user_products

end
