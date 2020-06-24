class OrderedProduct < ApplicationRecord
	belongs_to :order
	belongs_to :product

	validates :product_id, :order_id, :count,
			  		:price, presence: true
end


