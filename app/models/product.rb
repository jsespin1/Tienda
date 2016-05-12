class Product < ActiveRecord::Base
	#t.string   "nombre"
    #t.integer  "precio"
    #t.boolean  "active"
    #t.text     "descripcion"
    #t.string   "imagen"
	has_and_belongs_to_many :promocions
	has_many :order_items 
end
