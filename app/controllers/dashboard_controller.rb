class DashboardController < ApplicationController
  def index
    @beverages = Beverage.all
    @num_beverages = @beverages.count
    @sum_beverages = @beverages.reduce(0) { |sum, beverage| sum + (beverage['in_storage'] || 0)}
    @your_orders = Order.where.not(state: :delivered).where(user: current_user).order('created_at desc')
  end
end
