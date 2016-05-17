class AddCantidadProductosToPromocion < ActiveRecord::Migration
  def change
    add_column :promocions, :cantidad_productos, :int
  end
end
