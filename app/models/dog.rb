class Dog < ApplicationRecord
  belongs_to :customer

  validates :main_breed, :dog_name, presence: true
end
