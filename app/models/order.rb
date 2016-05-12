class Order < ActiveRecord::Base

  belongs_to :order_status
  belongs_to :user
  has_many :order_items
end
