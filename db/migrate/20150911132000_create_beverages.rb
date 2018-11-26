# frozen_string_literal: true

class CreateBeverages < ActiveRecord::Migration[5.0]
  def change
    create_table :beverages do |t|
      t.string :name
      t.integer :in_storage

      t.timestamps null: false
    end
  end
end
