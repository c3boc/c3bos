class Api::V1::PrintController < Api::V1::BaseController


  def list
    @orders = Order.where(printed: false)
    render "print/list"
  end

  def set_printed
    @order = Order.find(params[:id])
    @order.printed = true
    @order.save
    render "print/set_printed"
  end

end
