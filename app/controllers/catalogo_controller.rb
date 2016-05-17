class CatalogoController < ApplicationController


	def index
		@items = Catalogo.getRandom
		@vista = "index"
	end

	def autos
		@items = Catalogo.getAutos
		@vista = "autos"
		render 'index'
	end

	def perros
		@items = Catalogo.getPerros
		@vista = "perros"
		render 'index'
	end

	def promociones
		@items = Catalogo.getPromociones
		@vista = "promociones"
	end



end
