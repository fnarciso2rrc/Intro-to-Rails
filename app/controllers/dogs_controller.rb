class DogsController < ApplicationController
  include PaginationHelper
  def index
    @dogs = paginate(Dog.all, params[:page].to_i)
  end

  def show
    @dog = Dog.find(params[:id])
  end
end
