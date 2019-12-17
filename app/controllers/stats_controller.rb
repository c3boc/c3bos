# frozen_string_literal: true

class StatsController < ApplicationController
  def index
    @beverage_orders = OrderItem.all.group_by(&:beverage).map do |beverage, orders|
      [beverage.name, orders.reduce(0) { |sum, n| sum + (n.amount.present? ? n.amount : 0) }]
    end
    @orders_by_user = User.all.map do |user|
      order_items = user.orders.reduce([]) { |sum, n| sum + n.order_items }
      beverage_orders = order_items.group_by(&:beverage).map do |beverage, orders|
        [beverage.name, orders.reduce(0) { |sum, n| sum + (n.amount.present? ? n.amount : 0) }]
      end
      [user.username, beverage_orders]
    end
  end
end
