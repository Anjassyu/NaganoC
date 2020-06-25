class Order < ApplicationRecord
	has_many :ordered_products, dependent: :destroy
	belongs_to :customer


	validates :customer_id, :address,:name, :postage, :billing_amount, :payment, presence: true
	validates :postcode, length: {is: 7}, numericality: { only_integer: true }
	validates :postage, :billing_amount, numericality: { only_integer: true }

	enum payment: {クレジットカード:1, 銀行振込:2}

	enum order_status:{入金待ち:1,入金確認:2,製作中:3,発送準備中:4,発送済み:5}


	def fullname_kanji
		[family_name_kanji, first_name_kanji].join('')
	end

	def full_address
		[postcode, address, fullname_kanji].join('')
	end


	scope :from_customer, -> (customer_id){ where( customer_id: customer_id )}
	scope :created_today, -> (created_at){ where("created_at >= ?", Date.current )}


end



