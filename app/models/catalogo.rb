class Catalogo < ActiveRecord::Base
	#Simplemente se encarga de retornar los productos que el catalogo requiere
	def self.getRandom
		items = Product.all
	end

	def self.getAutos
		items = Product.where(["tipo= ?", "auto"])
	end

	def self.getPerros
		items = Product.where(["tipo= ?", "perro"])
	end

	def self.getPromociones
		items = Promocion.all
	end

end
