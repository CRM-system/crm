class OrderStatus < ApplicationRecord

	validates :title, presence: true, length: { maximum: 50 }
	validates :description, presence: true, length: { maximum: 250 } 

	has_many :role_order_statuses
	has_many :roles, :through => :role_order_statuses
end
