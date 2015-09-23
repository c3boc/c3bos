class BeveragesController < ApplicationController
  before_action :authorize_admin

  def index
    @beverages = Beverage.all
    @beverage = Beverage.new
  end

  def create
    @beverage = Beverage.new(user_params)

    if @beverage.save
      redirect_to beverages_path, :info => "Beverage added"
    else
      redirect_to beverages_path, :danger => "Beverage not added"
    end
  end

  def destroy
    @beverage = Beverage.find(params[:id])
    @beverage.destroy

    redirect_to beverages_path, :info => "Beverage removed"
  end

  private
  def user_params
    params.require(:beverage).permit(:name, :in_storage)
  end

end
