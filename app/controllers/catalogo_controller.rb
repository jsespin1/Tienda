class CatalogoController < ApplicationController


	def index
		@items = Catalogo.getRandom
	end

	def autos
		@items = Catalogo.getAutos
	end

	def perros
		@items = Catalogo.getPerros
	end

	def promociones
		@items = Catalogo.getPromociones
	end



end
