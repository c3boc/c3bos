# frozen_string_literal: true

class StatsController < ApplicationController
  def index
    order_items = OrderItem.where.not(amount: nil).map do |item|
      [item.beverage.name, item.amount]
    end
    @data_ordered = order_items.each_with_object(Hash.new(0)) do |item, memo|
      memo[item.first] += item.last
    end

    @data_order_time = Order.group("to_char(created_at, 'YYYY-MM-DD HH24:00')").count
  end
end
