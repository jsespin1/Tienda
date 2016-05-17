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
		#items = Promocion.all(:conditions => ["cantidad_productos > ? and active = ?", 0, true])
		items = Promocion.where('cantidad_productos > 0 AND active = true')
		#Client.all(:conditions => ["created_at > ? AND created_at < ?", params[:start_date], params[:end_date]])
	end

end
