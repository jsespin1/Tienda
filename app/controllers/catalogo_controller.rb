class CatalogoController < ApplicationController


	def getInfo
		@tipo = params[:tipo]
		if @tipo=="producto"
			@item = Product.find(params[:id])
		else
			@item = Promocion.find(params[:id])
		end
		respond_to do |format|
			format.html {}
			format.json do 
				hash_info= {
				tipo: @tipo,
				nombre: @item.nombre,
				desc: @item.descripcion,
				}
				render json: hash_info
			end
		end
	end


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

	def show
		puts "HOLAAAA" + params.inspect
		@tipo = params[:tipo]
		if @tipo=="producto"
			@item = Product.find(params[:id])
		else
			@item = Promocion.find(params[:id])
		end
	end



end
