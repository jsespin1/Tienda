class Api::V1::ApiController < ApplicationController

	respond_to :json, :html
	protect_from_forgery with: :null_session

	before_filter :authenticate



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


	def update
		respond_to do |format|
			if request.head?
				head(params[:id])
			end
			if params[:id]
				existe = Product.exists(params[:id])
				params_coherentes = check_parameters(params)
				if existe and params_coherentes
					product = Product.update1(params)
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
			puts "ENV: " << env["REQUEST_METHOD"].to_s
			if request.head?
				head(params[:id])
				return
			end
			if params[:id]
				existe = Product.exists(params[:id])
				if existe 
					product = Product.find(params[:id])
					#product.destroy
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
				product = Product.find(params[:id])
				#response.headers['Last-Modified'] = product.updated_at
				response.headers['Last-Modified'] = "perro"
				format.json {render json: {}, status:200}
			else
				# format.json {render json: {description: 'Bad Parameters'}, status:400}
				format.json {render json: nothing: true, status:400}
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
		params.except(:action, :controller, :format, :id).each do |p|
			unless prod_params.include?(p[0].to_s)
			    coherente = false
			end
		end
		coherente
	end


	def getTags
		respond_to do |format|
			if params[:tag] and params[:access_token]
				tag = params[:tag]
				token = params[:access_token]
				cantidad = getCount(tag, token)
				posts = getPosts(tag,token)
				if cantidad != nil and cantidad != nil
					#Se procesan los posts
					respuesta = Array.new
					posts = posts['data']
					posts.each do |p|
						hash = {
							tags: p['tags'],
							username: p['user']['username'],
							likes: p['likes']['count'],
							url: p['link'],
							caption: p['caption']['text']
						}
						respuesta.push(hash)
					end
					format.json {render json: {cantidad: cantidad, posts: respuesta},status:200}
				else
					format.json {render json: {description: 'No se pudo procesar la solicitud'},status:404}
				end
			else
				format.json {render json: {description: 'Missing parameters'},status:400}
			end
		end
	end


	def getCount(tag, token)
		ruta = "https://api.instagram.com/v1/tags/"
		url = URI.parse(ruta << tag)
		query = { access_token: token.to_s}
		respuesta = HTTParty.get(url, :query => query)
		if respuesta.to_s.include? 'data'
			cantidad = respuesta['data']['media_count']
		else
			cantidad = nil
		end
		cantidad
	end

	def getPosts(tag, token)
		ruta = "https://api.instagram.com/v1/tags/"
		url = URI.parse(ruta << tag << "/media/recent")
		query = { access_token: token.to_s}
		respuesta = HTTParty.get(url, :query => query)
		if !(respuesta.to_s.include? 'attribution')
			respuesta = nil
		end
		respuesta
	end

end