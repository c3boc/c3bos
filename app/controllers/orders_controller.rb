class OrdersController < ApplicationController

  def index
    
    @orders = Order.order('id desc').all
  end

  def new
    @order = Order.new
    @order.order_items = Beverage.all.map do |beverage|
      OrderItem.new(beverage: beverage)
    end
    @locations = Location.all
  end

  def create
    @order = Order.new(order_params)

    @order.printed = false
    @order.user = current_user

    if @order.save
      redirect_to root_url, :success => "Order placed. Thank you!"
    else
      render "new"
    end
  end

  private
  def order_params
    params.require(:order).permit(:location_id, order_items_attributes: [:beverage_id, :amount])
  end

end
