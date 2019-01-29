class Order < ApplicationRecord
	enum status: [ :new_order, :processed, :refused, :problematic, :completed ]

  belongs_to :product

  before_validation { client_name.capitalize! }
  before_validation { client_email.downcase! }

  validates :client_name, presence: true, length: { maximum: 50 }
  validates :client_phone, presence: true, length: { maximum: 12 }
  validates :client_email, format: { with: URI::MailTo::EMAIL_REGEXP },
  					length: { maximum: 100 }
  validates :client_addres, presence: true, length: { maximum: 250 }
  validates :delivery_type, presence: true, length: { maximum: 250 }
  validates :order_price, presence: true, numericality: { greater_or_equal_to: 0 }
  validates :quantity, presence:true, numericality: { greater_or_equal_to: 0 }
  validates :total_price, presence:true, numericality: { greater_or_equal_to: 0 }
end
