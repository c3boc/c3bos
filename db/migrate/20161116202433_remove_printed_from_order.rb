class RemovePrintedFromOrder < ActiveRecord::Migration
  def change
    remove_column :orders, :printed, :boolean
  end
end
