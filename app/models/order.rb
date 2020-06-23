class Order < ApplicationRecord
	has_many :ordered_products, dependent: :destroy
	belongs_to :customer

	enum payment: {クレジットカード:1, 銀行振込:2}

	validates :customer_id, :address,:name, :postage,
			  		:billing_amount, :payment,
			  		presence: true
	validates :postcode, length: {is: 7}, numericality: { only_integer: true }
	validates :postage, :billing_amount, numericality: { only_integer: true }
end