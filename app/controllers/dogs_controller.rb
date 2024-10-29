class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def show
    @dogs = Dog.find(param[:id])
  end
end
