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


  def get_all

    products = Product.all
    respuesta = Array.new
    url = "localhost:3000/api/v1/products/"
    products.each do |p|
      id = p.id
      url = url + id.to_s
      hash = {
        fully_url: url,
      }
      respuesta.push(hash)
    end
    respuesta
  end


end
