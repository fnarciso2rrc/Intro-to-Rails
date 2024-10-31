class ProductsController < ApplicationController
  include PaginationHelper
  def index
    @products = paginate(Product.all, params[:page].to_i)
  end

  def show
    @product = Product.find(params[:id])
  end
end
