# frozen_string_literal: true

class AddAllowToOrderPermission < ActiveRecord::Migration[5.2]
  def change
    add_column :order_permissions, :allow, :boolean, null: false, default: false
  end
end
