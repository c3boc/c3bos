class Beverage < ActiveRecord::Base
  has_many :order_item
end
