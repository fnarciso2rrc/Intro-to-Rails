class Customer < ApplicationRecord
  has_many :dogs
  has_many :customer_products

  validates :first_name, :last_name, :age, presence: true
  validates :age, numericality: { only_integer: true, :greater_than: 0 }
end
