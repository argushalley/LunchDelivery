class Admin::SideDishesController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :read, SideDish
    @side_dishes = SideDish.all
  end

  def show
    authorize! :read, SideDish
    @side_dish = SideDish.find(params[:id])
  end

  def new
    authorize! :create, SideDish
    @side_dish = SideDish.new
  end

  def create
    authorize! :create, SideDish
    @side_dish = SideDish.new(side_dish_params)

    if @side_dish.save
      respond_with @side_dish, location: [:admin, @side_dish]
    else
      render 'new'
    end
  end

  def edit
    authorize! :update, SideDish
    @side_dish = SideDish.find(params[:id])
  end

  def update
    authorize! :update, SideDish
    @side_dish = SideDish.find(params[:id])
    @side_dish.update_attributes(side_dish_params)
    respond_with @side_dish, location: [:admin, @side_dish]
  end

  def destroy
    authorize! :destroy, SideDish
    @side_dish = SideDish.find(params[:id])
    @side_dish.destroy
    respond_with @side_dish, location: admin_side_dishes_path
  end

  private

  def side_dish_params
    params.require(:side_dish).permit(:name)
  end
end
