class DashboardController < ApplicationController
  def index
    @locations = Location.all
    @num_locations = @locations.count

    @beverages = Beverage.all
    @num_beverages = @beverages.count
    @sum_beverages = @beverages.reduce(0) { |sum, beverage| sum + beverage['in_storage']}
  end
end
