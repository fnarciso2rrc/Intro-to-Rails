class Dog < ApplicationRecord
  validates :main_breed, :sub_breed, :dog_name, presence: true
end
