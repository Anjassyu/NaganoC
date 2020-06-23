class OrderedProduct < ApplicationRecord
	belongs_to :order
	belongs_to :product
	validates :product_id, :order_id, :count,
			  		:price, presence: true
	validates :price, :count, numericality: { only_integer: true }
end


