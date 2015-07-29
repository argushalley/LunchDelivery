class SideDishesController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html

  def index
    @side_dishes = SideDish.all
  end

  def show
    @side_dish = SideDish.find(params[:id])
  end

  def new
    @side_dish = SideDish.new
  end

  def create
    @side_dish = SideDish.new(side_dish_params)

    if @side_dish.save
      respond_with @side_dish
    else
      render 'new'
    end
  end

  def edit
    @side_dish = SideDish.find(params[:id])
  end

  def update
    @side_dish = SideDish.find(params[:id])
    @side_dish.update_attributes(side_dish_params)
    respond_with @side_dish
  end

  def destroy
    @side_dish = SideDish.find(params[:id])
    @side_dish.destroy

    redirect_to side_dishes_path
  end

  private

  def side_dish_params
    params.require(:side_dish).permit(:name)
  end
end
