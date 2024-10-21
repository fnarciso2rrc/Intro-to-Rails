class Customer < ApplicationRecord
  belongs_to :product
  belongs_to :dog

  validates :first_name, :last_name, :age, presence: true
  validates :age, numericality: { only_integer: true, :greater_than => 0 }
end
