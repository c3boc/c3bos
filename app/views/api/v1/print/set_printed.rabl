# frozen_string_literal: true

object @order

attributes :id
glue :location do
  attributes title: :location
end
child :order_items, object_root: false do
  attributes :amount
  glue :beverage do
    attributes name: :beverage
  end
end
