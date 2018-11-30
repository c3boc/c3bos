# frozen_string_literal: true

class Beverage < ActiveRecord::Base
  has_many :order_item
  has_many :order_permissions, dependent: :destroy
  has_many :users, through: :order_permissions
end
