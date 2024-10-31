class CustomersController < ApplicationController
  def index
    @customers = Customer.search(params[:search])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  private
  
  def customer_params
    params.require(:customer).permit(:first_name, last_name, :id, :search)
  end

end
