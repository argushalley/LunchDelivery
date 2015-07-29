class Admin::OrdersController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html

  def index
    authorize! :read, Order
    @orders = Order.all
  end

  def show
    authorize! :read, Order
    @order = Order.find(params[:id])
  end

  def new
    authorize! :create, Order
    @order = Order.new
    @order.meats.build
    @order.side_dishes.build
    @order.build_address
  end

  def create
    authorize! :create, Order
    @order = Order.new(order_params)

    if @order.save
      respond_with @order, location: [:admin, @order]
    else
      render 'new'
    end
  end

  def edit
    authorize! :update, Order
    @order = Order.find(params[:id])
  end

  def update
    authorize! :update, Order
    @order = Order.find(params[:id])
    @order.update_attributes(order_params)
    respond_with @order, location: [:admin, @order]
  end

  def destroy
    authorize! :destroy, Order
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to admin_orders_path
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
