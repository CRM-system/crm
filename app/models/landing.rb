class Landing < ApplicationRecord
  has_many :products, dependent: :destroy
end
