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

  def deliver
    beverage = Beverage.find(params.require(:beverage_id))

    amount = params.require(:amount).to_i

    if amount < 1
      redirect_to beverages_path, :danger => "Not delivered! Amount to small: #{amount}"
      return
    end

    beverage.in_storage += amount

    if beverage.save
      redirect_to beverages_path, :info => "Added #{amount} crates to #{beverage.name}"
    else
      redirect_to beverages_path, :dager => "Not delivered! Cannot save Beverage!"
    end
  end

  private
  def user_params
    params.require(:beverage).permit(:name, :in_storage)
  end

end
