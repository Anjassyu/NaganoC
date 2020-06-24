class Order < ApplicationRecord
	has_many :ordered_products, dependent: :destroy
	belongs_to :customer

	enum payment: {クレジットカード:1, 銀行振込:2}

	def fullname_kanji
     [family_name_kanji, first_name_kanji].join('')
    end

    def full_address
     [postcode, address, fullname_kanji].join('')
    end
end

