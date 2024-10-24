class Product < ApplicationRecord
  has_many :customer_products

  validates :product_name, :category, :price, :description, presence: true
  validates :price, numericality: {greater_than: 0}
end
