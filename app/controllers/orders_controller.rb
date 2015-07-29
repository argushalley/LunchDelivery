class OrdersController < ApplicationController
  respond_to :html

  def index
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @order.meats.build
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      #respond_with @user, location: [:admin, @user]
      respond_with @order
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def order_params
    params.require(:order).permit(
      meat_ids: []
    )
  end
end
