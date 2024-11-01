class ProductsController < ApplicationController
  def index
    @products = Product.search(params[:search]).page(params[:page]).per(20)
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :id, :search)
  end
end
