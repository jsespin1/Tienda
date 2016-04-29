class AddAdressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :direccion, :string, :default => ""
    add_column :users, :comuna, :string, :default => ""
    add_column :users, :pais, :string, :default => ""
  end
end
