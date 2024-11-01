class Dog < ApplicationRecord
  belongs_to :customer, optional: true

  validates :main_breed, :dog_name, presence: true

  def self.search(search)
    if search.present?
      Dog.where("dog_name LIKE ?", "%#{search}%")
    else
      @dogs = Dog.all
    end
  end
end
