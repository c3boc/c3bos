class ChangeUserRoleDefaultValue < ActiveRecord::Migration[5.0]
  def change
    change_column_null :users, :role, false
  end
end
