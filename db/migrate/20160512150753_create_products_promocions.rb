class CreateProductsPromocions < ActiveRecord::Migration
  def change
    create_table :products_promocions do |t|
    	t.integer :product_id
    	t.integer :promocion_id
    end
  end
end
