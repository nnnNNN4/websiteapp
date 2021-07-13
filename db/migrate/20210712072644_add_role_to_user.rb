class AddRoleToUser < ActiveRecord::Migration[6.0]

  def change
    add_column :users, :role, :integer, default: 0, after: :image
  end
  
end
