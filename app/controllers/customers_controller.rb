class CustomersController < ApplicationController
  include PaginationHelper
  def index
    @customers = paginate(Customer.all, params[:page].to_i)
  end

  def show
    @customer = Customer.find(params[:id])
  end
end
