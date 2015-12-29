class Order < ActiveRecord::Base
  belongs_to :location
  has_many :order_items
  accepts_nested_attributes_for :order_items
  validates :location, presence: { message: "Please specify geodata." }
end
