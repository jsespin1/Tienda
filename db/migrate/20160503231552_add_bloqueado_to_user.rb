class AddBloqueadoToUser < ActiveRecord::Migration
  def change
    add_column :users, :bloqueado, :boolean, :default => false
  end
end
