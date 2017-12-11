class AddStateToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :state, :integer, default: 0
  end
end
