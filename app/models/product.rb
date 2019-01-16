class Product < ApplicationRecord
    validates :name, presence: true, length: { maximum: 150 }
              :price, presence:true
              :description, presence: true, length: {maximum: 200}
end
