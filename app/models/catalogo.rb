class Catalogo < ActiveRecord::Base
	#Simplemente se encarga de retornar los productos que el catalogo requiere
	def self.getRandom
		items = Product.all
	end

	def self.getAutos
		items = Product.where(:tipo => "auto", :active => true)
	end

	def self.getPerros
		items = Product.where(:tipo => "perro", :active => true)
	end

	def self.getPromociones
		items = Promocion.where('cantidad_productos > 0 AND active = true')
	end

end
