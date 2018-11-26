# frozen_string_literal: true

class StatsController < ApplicationController
  def index
    @data_instock = Beverage.pluck(:name, :in_storage)

    order_items = OrderItem.where.not(amount: nil).map do |item|
      [item.beverage.name, item.amount]
    end
    @data_ordered = order_items.each_with_object(Hash.new(0)) do |item, memo|
      memo[item.first] += item.last
    end

    @data_order_time = Order.group("strftime('%Y-%m-%d %H:00', created_at)").count
  end
end
