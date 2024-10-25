require "csv"
require 'net/http'
require 'json'
require 'faker'


CustomerProduct.delete_all
Dog.delete_all
# Customer.delete_all
Product.delete_all


# DOGS
url = 'https://dog.ceo/api/breeds/list/all'
uri = URI(url)
response = Net::HTTP.get(uri)
dog_breeds = JSON.parse(response)

# Store in array
breeds = dog_breeds['message'].flat_map do |breed, sub_breeds|
    sub_breeds.empty? ? [breed] : sub_breeds.map { |sub| "#{breed}-#{sub}" }
end

25.times do
    main_breed = breeds.sample

    breed_parts = main_breed.split('-')

    if breed_parts.length > 1
        # It has a sub-breed, use it as the sub-breed
        sub_breed = breed_parts[1]  # Get the sub-breed part
        main_breed = breed_parts[0]  # Get the main breed part
    else
    # No sub-breed, set sub_breed to nil or an empty string
    sub_breed = nil
    end

    dog = Dog.create(
        main_breed: main_breed,
        sub_breed: sub_breed,
        dog_name: Faker::Name.first_name,
    )

end

# PRODUCTS
productFile = Rails.root.join("db/GroceryDataset.csv")
productCSV = File.read(productFile)

products = CSV.parse(productCSV, headers: true)

products.each do |product|
    new_product = Product.create(
        product_name: product["Title"],
        category: product["Sub Category"],
        price: Faker::Number.between(from: 1, to: 100),
        description: product["Product Description"]
    )
end

# CUSTOMER

100.times do
    new_customer = Customer.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        age: Faker::Number.between(from: 1, to: 100)
        dog: Dog.find(Faker::Number.between(from: 1, to: 25))
    )
end

puts "There are #{Dog.count} Dog"
puts "There are #{Product.count} Product"
puts "There are #{Customer.count} Customers"


