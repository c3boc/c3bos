class BeveragesController < ApplicationController
  def index
    @beverages = Beverage.all
    @beverage = Beverage.new
  end

  def create
    @beverage = Beverage.new(user_params)

    if @beverage.save
      redirect_to beverages_path, :info => "Beverage added"
    else
      render "new"
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
