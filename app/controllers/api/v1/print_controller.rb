# frozen_string_literal: true

module Api
  module V1
    class PrintController < BaseController
      def list
        @orders = Order.where(state: :pending)
        render 'print/list'
      end

      def set_printed
        @order = Order.find(params[:id])
        @order.state = :printed
        @order.save
        render 'print/set_printed'
      end
    end
  end
end
