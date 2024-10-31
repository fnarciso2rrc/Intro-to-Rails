class Product < ApplicationRecord
  has_many :customer_products
  has_many :customers, through: :customer_products

  validates :product_name, :category, :price, :description, presence: true
  validates :price, numericality: {greater_than: 0}

  def self.search(search)
    if search.present?
      Product.where("product_name LIKE ?", "%#{search}%")
    else
      @products = Product.all
    end
  end

end
