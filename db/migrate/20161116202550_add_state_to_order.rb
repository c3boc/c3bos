class AddStateToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :state, :integer, default: 0
  end
end
