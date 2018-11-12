class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :beverage

  after_save do |order_item|
    beverage = Beverage.find(order_item.beverage.id)
    beverage.in_storage = beverage.in_storage - order_item.amount if order_item.amount
    beverage.save
  end

  before_destroy do |order_item|
    beverage = Beverage.find(order_item.beverage.id)
    beverage.in_storage = beverage.in_storage + order_item.amount if order_item.amount
    beverage.save
  end
end
