class Customer < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	has_many :orders
	has_many :deliveries, dependent: :destroy
	has_many :cart_items, dependent: :destroy

	def active_for_authentication?
      super && (self.admission_status == true) #会員ステータスが退会だとログインできない
    end

    def fullname_kanji
		[family_name_kanji, first_name_kanji].join('')
	end

	def fullname_kana
		[family_name_kana, first_name_kana].join('')
	end

	def admission_status_name

		if admission_status == true
			return "有効"
		else
			return "退会済"
		end
	end
end

