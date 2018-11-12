class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :beverage
end
