class OrderPermission < ApplicationRecord
  belongs_to :beverage
  belongs_to :user
end
