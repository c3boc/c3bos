class RemoveAmountFromBeverage < ActiveRecord::Migration[5.1]
  def change
    remove_column :beverages, :in_storage, :integer
  end
end
