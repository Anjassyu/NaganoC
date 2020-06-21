class Delivery < ApplicationRecord
belongs_to :customer

validates :postcode,{
	presence: true,
	length: {maximum: 8}
}

validates :address,{
	presence: true,
	length: {minimum: 1}
}

validates :name,{
	presence: true,
	length: {minimum: 1}
}
end

