class Product < ApplicationRecord
  validates :product_name, :category, :price, :description, presence: true
  validates :price, numericality: {greater_than: 0}
end
