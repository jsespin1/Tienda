class Catalogo < ActiveRecord::Base
	#Simplemente se encarga de retornar los productos que el catalogo requiere
	def self.getRandom
		items = Product.all.shuffle
	end

	def self.getAutos
		#items = Product.where(:tipo => "auto", :active => true)
		items = Product.where(:tipo => "auto")
	end

	def self.getPerros
		#items = Product.where(:tipo => "perro", :active => true)
		items = Product.where(:tipo => "perro")
	end

	def self.getPromociones
		#items = Promocion.where('cantidad_productos > 0 AND active = true')
		items = Promocion.where('cantidad_productos > 0')
	end

end
