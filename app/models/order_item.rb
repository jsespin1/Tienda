class OrderItem < ActiveRecord::Base
	belongs_to :product
	belongs_to :promocion
	belongs_to :order


end
