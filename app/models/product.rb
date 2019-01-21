class Product < ApplicationRecord
	has_one_attached :picture
	validates :name, presence: true, length: { maximum: 150 }
	validates :price, presence: true
	validates :description, presence: true, length: {maximum: 200}
end
