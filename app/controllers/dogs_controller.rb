class DogsController < ApplicationController
  def index
    @dogs = Dog.search(params[:search]).page(params[:page]).per(20)
  end

  def show
    @dog = Dog.find(params[:id])
  end

  private

  def dog_params
    params.require(:dog).permit(:dog_name, :id, :search)
  end
end
