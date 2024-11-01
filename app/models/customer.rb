class Customer < ApplicationRecord
  has_many :dogs
  has_many :customer_products
  has_many :products, through: :customer_products

  validates :first_name, :last_name, :age, presence: true
  validates :age, numericality: { only_integer: true, greater_than: 0 }

  def self.search(search)
    if search.present?
      Customer.where("first_name LIKE ? OR last_name LIKE ?", "%#{search}%", "%#{search}%")
    else
      @customers = Customer.all
    end
  end
end
