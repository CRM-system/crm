class Role < ApplicationRecord
	validates :name, presence: true, length: { maximum: 50 }

	has_many :workers
  has_many :functions, dependent: :destroy
  has_many :role_order_statuses
  has_many :order_statuses, :through => :role_order_statuses

end
