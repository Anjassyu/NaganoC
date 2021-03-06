class Product < ApplicationRecord
	has_many :ordered_products
	has_many :cart_items
	has_many :orders, through: :ordered_products
	belongs_to :genre

	validates :name, presence: true, length: { maximum: 50 }
	validates :genre_id, presence: true
	validates :description, presence: true, length: { maximum: 200 }
	validates :price, presence: true
	validates :sales_status, inclusion: { in: [true, false] }

	attachment :image
    scope :from_genre, -> (genre_id){ where( genre_id: genre_id )}
    
end

