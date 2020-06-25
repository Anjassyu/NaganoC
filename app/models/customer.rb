class Customer < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	has_many :orders
	has_many :deliveries, dependent: :destroy
	has_many :cart_items, dependent: :destroy

  validates :email, presence: true
  validates :password,
  presence: true,
  length: { in: Devise.password_length },
  confirmation: true,
  on: :create

  validates :password,
  allow_nil: true,
  length: { in: Devise.password_length },
  confirmation: true,
  on: :update

  validates :family_name_kanji, presence: true,format: { with: /\A[一-龥]+\z/}
  validates :family_name_kana, presence: true,format: { with: /\A[ァ-ヶー－]+\z/}
  validates :first_name_kanji, presence: true,format: { with: /\A[一-龥]+\z/}
  validates :first_name_kana, presence: true,format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :postcode, presence: true
  validates :address, presence: true
  validates :tel, presence: true,format: { with: /\A\d{10,11}\z/ }
  validates :admission_status, inclusion: { in: [true, false] }


	def full_name
  	family_name_kanji + first_name_kanji
  end

  def fullname_kanji
    [family_name_kanji, first_name_kanji].join('')
  end

  def fullname_kana
    [family_name_kana, first_name_kana].join('')
  end


	def active_for_authentication?
      super && (self.admission_status == true) #会員ステータスが退会だとログインできない
  end

  def admission_status_name

    if admission_status == true
      return "有効"

    else
      return "退会済"
    end
  end

end

