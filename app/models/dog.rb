class Dog < ApplicationRecord
  belongs_to :customers
  validates :main_breed, :sub_breed, :dog_name, presence: true
end
