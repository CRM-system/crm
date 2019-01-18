class Product < ApplicationRecord
    validates :name, presence: true, length: { maximum: 150 }
    validates :price, presence: true
    validates :description, presence: true, length: {maximum: 200}
    has_one_attached :picture

end
