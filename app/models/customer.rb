class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	has_many :orders
	has_many :deliveries, dependent: :destroy
	has_many :cart_items, dependent: :destroy

    def fullname_kanji
		[family_name_kanji, first_name_kanji].join('')
	end

	def fullname_kana
		[family_name_kana, first_name_kana].join('')
	end


end
