class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  accepts_nested_attributes_for :order_items

  enum state: [:pending, :printing, :inprogress, :delivered]
end
