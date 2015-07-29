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
    binding.pry
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
      #meats_attributes: [:id, :type]
      meat_ids: [:type]#,
      #side_dish_attributes: [:id, :type],
      #address_attributes: [:id, :street, :number, :reference]
    )
  end
end
