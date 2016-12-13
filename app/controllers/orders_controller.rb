class OrdersController < ApplicationController

  def index

    @orders = Order.order('id desc').paginate(page: params[:page])
  end

  def new
    @order = Order.new
    @order.order_items = Beverage.all.map do |beverage|
      OrderItem.new(beverage: beverage)
    end

    @last_order = Order.where(user: current_user).order('created_at desc').first
  end

  def create
    @order = Order.new(order_params)

    @order.pending!
    @order.user = current_user

    if @order.save
      redirect_to root_url, :success => "Order placed. Thank you!"
    else
      render "new"
    end
  end

  private
  def order_params
    params.require(:order).permit(order_items_attributes: [:beverage_id, :amount])
  end

end
