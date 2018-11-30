# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authorize

  def index
    @orders = Order.order('id desc').paginate(page: params[:page])
  end

  def new
    @order = Order.new
    beverages = current_user.order_permissions.where(allow: true).map(&:beverage)

    @order.order_items = beverages.map do |beverage|
      OrderItem.new(beverage: beverage)
    end

    @last_order = Order.where(user: current_user).order('created_at desc').first
  end

  def create
    @order = Order.new(order_params)

    @order.user = current_user
    @order.pending!

    if @order.save
      redirect_to root_url, success: 'Order placed. Thank you!'
    else
      render 'new'
    end
  end

  private

  def order_params
    params.require(:order).permit(order_items_attributes: %i[beverage_id amount])
  end
end
