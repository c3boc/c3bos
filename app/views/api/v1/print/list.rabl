collection @orders, object_root: false

attributes :id, :created_at

child :order_items, object_root: false do
  attributes :amount
  glue :beverage do
    attributes name: :beverage
  end
end

glue :location do
  attributes title: :location
end

glue :user do
  attributes username: :user
end
