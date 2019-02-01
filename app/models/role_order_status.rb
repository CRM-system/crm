class RoleOrderStatus < ApplicationRecord
	belongs_to :order_status
	belongs_to :role
end
