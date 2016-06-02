class CatalogoController < ApplicationController


	def getInfo
		@tipo = params[:tipo]
		if @tipo=="producto"
			@item = Product.find(params[:id])
			descripcion = @item.descripcion
		else
			@item = Promocion.find(params[:id])
			descripcion = @item.comentario
		end
		respond_to do |format|
			format.html {}
			format.json do 
				hash_info= {
				id: params[:id],
				tipo: @tipo,
				nombre: @item.nombre,
				desc: descripcion,
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
		@tipo = params[:tipo]
		if @tipo=="producto"
			@item = Product.find(params[:id])
		else
			@item = Promocion.find(params[:id])
		end
	end




end
