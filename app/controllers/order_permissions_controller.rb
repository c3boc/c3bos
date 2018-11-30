# frozen_string_literal: true

class OrderPermissionsController < ApplicationController
  def index
    beverages = Beverage.all
    @order_permission_grid = User.all.map do |user|
      beverages.map do |beverage|
        OrderPermission.find_or_create_by(user: user, beverage: beverage)
      end
    end
  end

  def batch_update
    puts params['order_permissions']
    puts params
    success = true
    params['order_permissions'].each do |permission_id, values|
      p = OrderPermission.find(permission_id)
      p.allow = values['allow']
      success &&= p.save
    end
    if success
      redirect_to order_permissions_path, success: 'Permissions saved'
    else
      redirect_to order_permissions_path, danger: 'Something somewhere went horribly wrong.'
    end
  end
end
