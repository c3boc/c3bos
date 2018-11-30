# frozen_string_literal: true

class OrderPermission < ActiveRecord::Base
  belongs_to :beverage
  belongs_to :user
end
