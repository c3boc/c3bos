class CreateOrderPermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :order_permissions do |t|
      t.references :beverage, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
