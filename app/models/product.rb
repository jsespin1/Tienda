class Product < ActiveRecord::Base
	has_and_belongs_to_many :promocions
	has_many :order_items 
end
