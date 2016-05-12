class Catalogo < ActiveRecord::Base
	#Simplemente se encarga de retornar los productos que el catalogo requiere
	def self.getRandom
		items = Product.all
	end

	def self.getAutos
		items = Product.all
	end

	def self.getPerros
		items = Product.all
	end

	def self.getPromociones
		items = Product.all
	end

end
