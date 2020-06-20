class Order < ApplicationRecord
	has_many :ordered_products, dependent: :destroy
	belongs_to :customer

	enum payment: {クレジットカード:1, 銀行振込:2}

end

