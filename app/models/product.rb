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
  validates :descripcion, :presence => true
  validates :imagen, length: { minimum: 0, allow_nil: false, message: "can't be nil" }

  before_create :set_uuid

  def self.get_all
    products = Product.all
    respuesta = Array.new
    products.each do |p|
      if Rails.env == 'development'
          url = "localhost:3000/api/v1/products/"
      else
          url = "fathomless-plains-96262.herokuapp.com/api/v1/products/"
      end
      uuid = p.uuid
      url = url + uuid.to_s
      hash = {
        fully_url: url,
      }
      respuesta.push(hash)
    end
    respuesta
  end


  def self.update(params)
    actualizado = false
    product = Product.find_by_uuid(params[:id])
    if product.update_attributes(params[:product].permit(:nombre, :precio, :descripcion, :imagen))
      actualizado = true
    end
    actualizado
  end

  def self.exists(id)
    existe = false
    product = Product.find_by_uuid(id)
    if product
      existe = true
    end
    existe
  end

  def set_uuid
    uuid = SecureRandom.hex
    self.uuid = uuid
  end

end
