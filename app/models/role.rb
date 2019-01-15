class Role < ApplicationRecord
	validates :name, presence: true, length: { maximum: 50 }
	has_many :workers
end
