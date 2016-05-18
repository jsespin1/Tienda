class Promocion < ActiveRecord::Base
	#t.integer  "subtotal"
    #t.integer  "descuento"
    #t.string   "nombre"
    #t.text     "comentario"
    #t.boolean  "active"
    #t.string   "imagen"

	has_and_belongs_to_many :products  
	has_many :order_items 

	validates :nombre, :presence => true, :length => { :in => 2..20 }
  	validates :subtotal, :presence => true
  	validates :descuento, :presence => true




	def self.set_subtotal(promocion)
		productos = promocion.products
		subtotal = 0
		productos.each do |p|
			#puts "Producto: "+p.precio.to_s
			subtotal = subtotal + p.precio
		end
		#puts "Descuento: " + promocion.descuento.to_s
		subtotal = subtotal - promocion.descuento
		promocion.update_attributes(:subtotal => subtotal)
	end



end
