collection @orders, object_root: false

attributes :id

child :order_items, object_root: false do
  attributes :amount
  glue :beverage do
    attributes name: :beverage
  end
end

glue :location do
  attributes title: :location
end
