# frozen_string_literal: true

class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :beverage
end
