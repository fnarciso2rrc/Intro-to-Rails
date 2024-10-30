class HomeController < ApplicationController
  def index
    @customers = Customer.all.limit(5)

    @products = Product.all.limit(5)

    @dogs = Dog.all.limit(5)
  end
end
