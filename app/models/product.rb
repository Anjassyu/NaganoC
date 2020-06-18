class Product < ApplicationRecord
	has_many :ordered_products
	has_many :cart_items
	has_many :orders, through: :ordered_products
	belongs_to :genre, optional: true

	validates :name, presence: true
	validates :genre_id, presence: true
	validates :description, presence: true
	validates :price, presence: true

	attachment :image
	def tax_included
		price * 1.10
	end
end


