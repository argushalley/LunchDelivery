class OrdersController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @order.meats.build
    @order.side_dishes.build
    @order.build_address
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      respond_with @order
    else
      render 'new'
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update_attributes(order_params)
    respond_with @order
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(
      meat_ids: [],
      side_dish_ids: [],
      address_attributes: [:street, :number, :reference]
    )
  end
end
