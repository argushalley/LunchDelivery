class OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @order = Order.new
    @order.meats.build
  end

  def create
    @order = Order.new(order_params)
    binding.pry
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
