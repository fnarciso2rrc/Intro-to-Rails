require "csv"
require 'net/http'
require 'json'
require 'faker'


CustomerProduct.delete_all

Customer.delete_all
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name = 'customers'")

Dog.delete_all
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name = 'dogs'")

Product.delete_all
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name = 'products'")


# DOGS
url = 'https://dog.ceo/api/breeds/list/all'
uri = URI(url)
response = Net::HTTP.get(uri)
dog_breeds = JSON.parse(response)

# Store in array
breeds = dog_breeds['message'].flat_map do |breed, sub_breeds|
    sub_breeds.empty? ? [ breed ] : sub_breeds.map { |sub| "#{breed}-#{sub}" }
end

75.times do
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
150.times do
    set_rand_dog_count = rand(0..10)

    new_customer = Customer.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        age: Faker::Number.between(from: 1, to: 100)
    )

    set_rand_dog_count.times do
        rand_dog = Dog.order("RANDOM()").take

        if !Customer.exists?(dog_id: rand_dog.id)
            new_customer.update(dog_id: rand_dog.id)
        end
    end
end

# CustomerProduct
Customer.find_each do |customer|
    set_rand_product_count = rand(0..100)
    rand_products = Product.order("RANDOM()").limit(set_rand_product_count)

    rand_products.each do |product|
        CustomerProduct.create(
            customer_id: customer.id,
            product_id: product.id
        )
    end
end

puts "There are #{Dog.count} Dog"
puts "There are #{Product.count} Product"
puts "There are #{Customer.count} Customers"
puts "There are #{CustomerProduct.count} CustomerProduct entries"
