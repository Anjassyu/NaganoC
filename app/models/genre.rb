class Genre < ApplicationRecord
	has_many :products

	validates :name, presence: true
	validates :effectiveness, inclusion: { in: [true, false] }
end

