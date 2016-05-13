class Product < ActiveRecord::Base
	has_and_belongs_to_many :promocions
	has_many :order_items 

	validates :nombre, :presence => true, :length => { :in => 2..20 }
  	validates :precio, :presence => true
  	validates :tipo, :presence => true
end
