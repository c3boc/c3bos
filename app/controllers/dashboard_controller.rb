class DashboardController < ApplicationController
  def index
    @beverages = Beverage.all
    @your_orders = Order.where.not(state: :printed).where(user: current_user).order('created_at desc')
  end
end
