class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nombre, :string
    add_column :users, :apellido, :string, :default => ""
  end
end
