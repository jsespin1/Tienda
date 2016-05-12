class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :product, index: true, foreign_key: true
      t.references :promocion, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.integer :precio_unitario
      t.integer :cantidad
      t.integer :precio_total

      t.timestamps null: false
    end
  end
end
