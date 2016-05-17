class Product < ActiveRecord::Base
	#t.string   "nombre"
    #t.integer  "precio"
    #t.boolean  "active"
    #t.text     "descripcion"
    #t.string   "imagen"
	has_and_belongs_to_many :promocions
	has_many :order_items 

	validates :nombre, :presence => true, :length => { :in => 2..20 }
  	validates :precio, :presence => true
  	validates :tipo, :presence => true
end
