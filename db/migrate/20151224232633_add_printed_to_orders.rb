# frozen_string_literal: true

class AddPrintedToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :printed, :boolean
  end
end
