class Role < ApplicationRecord
	validates :name, presence: true, length: { maximum: 50 }
	has_many :workers
	has_many :functions, dependent: :destroy
	has_and_belongs_to_many :order_statuses
end
