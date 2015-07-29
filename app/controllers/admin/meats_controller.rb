class Admin::MeatsController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html

  def index
    authorize! :read, Meat
    @meats = Meat.all
  end

  def show
    authorize! :read, Meat
    @meat = Meat.find(params[:id])
  end

  def new
    authorize! :create, Meat
    @meat = Meat.new
  end

  def create
    authorize! :create, Meat
    @meat = Meat.new(meat_params)

    if @meat.save
      respond_with @meat, location: [:admin, @meat]
    else
      render 'new'
    end
  end

  def edit
    authorize! :update, Meat
    @meat = Meat.find(params[:id])
  end

  def update
    authorize! :update, Meat
    @meat = Meat.find(params[:id])
    @meat.update_attributes(meat_params)
    respond_with @meat, location: [:admin, @meat]
  end

  def destroy
    authorize! :destroy, Meat
    @meat = Meat.find(params[:id])
    @meat.destroy

    redirect_to admin_meats_path
  end

  private

  def meat_params
    params.require(:meat).permit(:name)
  end
end
