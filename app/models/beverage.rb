# frozen_string_literal: true

class Beverage < ActiveRecord::Base
  has_many :order_item
end
