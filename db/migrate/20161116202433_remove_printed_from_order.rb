class RemovePrintedFromOrder < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :printed, :boolean
  end
end
