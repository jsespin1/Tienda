class CreatePromocions < ActiveRecord::Migration
  def change
    create_table :promocions do |t|
      t.integer :subtotal
      t.integer :descuento
      t.string :nombre
      t.text :comentario
      t.boolean :active
      t.string :imagen

      t.timestamps null: false
    end
  end
end
