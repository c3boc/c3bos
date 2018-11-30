class OrderPermission < ActiveRecord::Base
  belongs_to :beverage
  belongs_to :user
end
