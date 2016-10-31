class DashboardController < ApplicationController
  def index
    @beverages = Beverage.all
    @num_beverages = @beverages.count
    @sum_beverages = @beverages.reduce(0) { |sum, beverage| sum + (beverage['in_storage'] || 0)}
  end
end
