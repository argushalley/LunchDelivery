class MeatsController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html

  def index
    @meats = Meat.all
  end

  def show
    @meat = Meat.find(params[:id])
  end

  def new
    @meat = Meat.new
  end

  def create
    @meat = Meat.new(meat_params)

    if @meat.save
      respond_with @meat
    else
      render 'new'
    end
  end

  def edit
    @meat = Meat.find(params[:id])
  end

  def update
    @meat = Meat.find(params[:id])
    @meat.update_attributes(meat_params)
    respond_with @meat
  end

  def destroy
    @meat = Meat.find(params[:id])
    @meat.destroy

    redirect_to meats_path
  end

  private

  def meat_params
    params.require(:meat).permit(:name)
  end
end
