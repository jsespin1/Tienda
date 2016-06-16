class Product < ActiveRecord::Base
	#t.string   "nombre"
    #t.integer  "precio"
    #t.boolean  "active"
    #t.text     "descripcion"
    #t.string   "imagen"
	has_and_belongs_to_many :promocions
	has_many :order_items 

	validates :nombre, :presence => true, :length => { :in => 2..100 }
  validates :precio, :presence => true
  validates :tipo, :presence => true


  def self.get_all
    products = Product.all
    respuesta = Array.new
    products.each do |p|
      url = "localhost:3000/api/v1/products/"
      id = p.id
      url = url + id.to_s
      hash = {
        fully_url: url,
      }
      respuesta.push(hash)
    end
    respuesta
  end

  def self.update1(params)
    actualizado = false
    product = Product.find(params[:id])
    if Product.create(params.except(:action, :controller, :format).permit(:id, :nombre, :precio, :descripcion, :imagen))
      actualizado = true
    end
    puts "Actualizado: " << actualizado.to_s
    actualizado
  end

  def self.update2(params)
    actualizado = false
    product = Product.find(params[:id])
    if product.update_attributes(params.permit(:nombre, :precio, :descripcion, :imagen))
      actualizado = true
    end
    actualizado
  end

  def self.exists(id)
    existe = false
    product = Product.find(id)
    if product
      existe = true
    end
    existe
  end

end
