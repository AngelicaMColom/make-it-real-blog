class AddRoleToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :role, :integre
  end
end
