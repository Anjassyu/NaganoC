class Order < ApplicationRecord
	has_many :ordered_products, dependent: :destroy
	belongs_to :customer

	enum payment: {クレジットカード:1, 銀行振込:2}

	 scope :from_customer, -> (customer_id){ where( customer_id: customer_id )}
	 scope :created_today, -> (created_at){ where("created_at >= ?", Date.current )}

  def fullname_kanji
    [family_name_kanji, first_name_kanji].join('')
  end

end

