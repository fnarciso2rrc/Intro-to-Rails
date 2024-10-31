class ProductsController < ApplicationController
  def index
    @products = Product.search(params[:search])
  end
  
  private
  def product_params
    params.require(:product).permit(:product_name, :id, :search)
  end

  def show
    @product = Product.find(params[:id])
  end
end
