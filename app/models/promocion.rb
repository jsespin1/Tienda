class Promocion < ActiveRecord::Base
	#t.integer  "subtotal"
    #t.integer  "descuento"
    #t.string   "nombre"
    #t.text     "comentario"
    #t.boolean  "active"
    #t.string   "imagen"

	has_and_belongs_to_many :products  
	has_many :order_items 

end
