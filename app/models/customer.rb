class Customer < ApplicationRecord
  belongs_to :product
  belongs_to :dog
end
