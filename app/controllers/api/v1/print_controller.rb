class Api::V1::PrintController < Api::V1::BaseController


  def list
    @orders = Order.all
    render "print/list"
  end

  def set_printed
    @order = Order.find(params[:id])
    puts @order
    render "print/set_printed"
  end

end
