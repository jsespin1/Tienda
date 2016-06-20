class Api::V1::ApiController < ApplicationController

	respond_to :json, :html
	protect_from_forgery with: :null_session
	skip_before_filter  :verify_authenticity_token

	before_filter :authenticate


	def controlador
		if request.get?
			#METODO GET GERARDO
			get
		elsif request.put?
			create
		elsif request.patch?
			update_patch
		elsif request.delete?
			delete
		elsif request.head?	
			head(params[:id])
		end
	end

	def get
		
		
		respond_to do |format|
			if Product.where(:id => params[:id]).present?
				product = Product.find(params[:id])
				fresh_when product
				format.json {render json: {products: product}, status:200}
			else
				format.json {render json: {description: 'Producto no existe'}, status:500}
			end
		end
		
	end

	def products
		#lo siguiente obtiene todas las url´s de los productos en forma de json
		products = Product.get_all 
		respond_to do |format|
			if products.count > 0
				format.json {render json: {products: products}, status:200}
			else
				format.json {render json: {description: 'Problems in DB'}, status:500}
			end
		end
	end


	def create
		params.permit!
		product = Product.new(params[:product])
		if Product.where(:id => params[:id]).present?
			update_put
			return
		else
			product.id = params[:id]

			respond_to do |format|
				if product.save

					puts "entre al save"
					format.json {render json: {products: product}, status:201}
				else
					puts "entre al error"
					format.json {render json: {description: product.errors}, status: 422}
				end
			end
		end
	end


	def update_put
		respond_to do |format|
			if params[:id]
				puts "PARAMETROS-> " << params.inspect
				params_coherentes = check_parameters(params)
				if  params_coherentes and check_parameters_put(params)
					product = Product.update(params)
					format.json {render json: {product: product, coherente: params_coherentes}, status:200}
				else
					format.json {render json: {description: 'Bad Parameters'}, status:400}
				end
			else
				format.json {render json: {description: 'Bad Parameters'}, status:400}
			end
		end
	end

	def update_patch
		respond_to do |format|
			if params[:id]
				existe = Product.exists(params[:id])
				params_coherentes = check_parameters(params)
				if existe and params_coherentes 
					product = Product.update(params)
					format.json {render json: {product: product, coherente: params_coherentes}, status:200}
				else
					format.json {render json: {description: 'Product doesn´t exist or Bad Parameters'}, status:400}
				end
			else
				format.json {render json: {description: 'Bad Parameters'}, status:400}
			end
		end
	end

	def delete
		respond_to do |format|
			if params[:id]
				existe = Product.exists(params[:id])
				if existe 
					product = Product.find_by_uuid(params[:id])
					product.destroy
					format.json {render json: {product: product}, status:200}
				else
					format.json {render json: {description: 'The product doesn´t exist'}, status:404}
				end
			else
				format.json {render json: {description: 'Bad Parameters'}, status:400}
			end
		end
	end



	def head(id)
		respond_to do |format|
			if params[:id]
				puts "Headers -> " << request.headers['Authorization'].inspect
				product = Product.find_by_uuid(params[:id])
				response.headers['Last-Modified'] = product.updated_at.to_s
				#response.headers['Last-Modified'] = "perro"
				format.json {render json: {}, status:200}
			else
				# format.json {render json: {description: 'Bad Parameters'}, status:400}
				format.json {render json: {}, status:400}
			end
		end
	end




#---------------------------------------Autenticacion--------------------------------------------#

	protected

	def authenticate
		autorizado = false
		@auth = Rack::Auth::Basic::Request.new(request.env)
	    authenticate_or_request_with_http_basic do |username, password|
	      authorized_user = User.authenticate(username, password)
	      if authorized_user
	      	autorizado = true
	      end
	   end
	   autorizado
	end

#---------------------------------------Métodos Internos--------------------------------------------#

	def check_parameters(params)
		coherente = true
		prod_params = ["nombre", "precio", "descripcion", "imagen"]
		lista = params[:product]
		lista.except(:action, :controller, :format, :id).each do |p|
			unless prod_params.include?(p[0].to_s)
			    coherente = false
			end
		end
		coherente
	end

	def check_parameters_put(params)
		#Debemos asegurar que estan todos lo campos
		coherente = false
		prod_params = ["nombre", "precio", "descripcion", "imagen"]
		lista = params[:product]
		contador = 0
		lista.except(:action, :controller, :format, :id).each do |p|
			if prod_params.include?(p[0].to_s)
			    contador = contador + 1
			end
		end
		if contador == prod_params.length
			coherente = true
		end
		coherente
	end


end