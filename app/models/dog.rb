class Dog < ApplicationRecord
  belongs_to :customer, optional: true

  validates :main_breed, :dog_name, presence: true
end
