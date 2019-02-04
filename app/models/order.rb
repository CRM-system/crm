class Order < ApplicationRecord
  include TranslateEnum
  enum status: [:new_order, :confirmed, :unconfirmed, :rejection, :find_out, :deferred,
                :assemblage, :prepared, :sent, :handed_in,
                :handed_and_paid, :return, :refund_received, :delivered,
                :reminder_1, :reminder_2, :wanted]
  translate_enum :status
  belongs_to :product

  before_validation { client_name.capitalize! }
  #before_validation { client_email.downcase! }

  validates :client_name, presence: true, length: { maximum: 50 }
  validates :client_phone, presence: true, length: { maximum: 12 }
  #validates :client_email, format: { with: URI::MailTo::EMAIL_REGEXP },length: { maximum: 100 }
  validates :client_addres, presence: true, length: { maximum: 250 }
  validates :delivery_type, presence: true, length: { maximum: 250 }
  validates :order_price, presence: true, numericality: { greater_or_equal_to: 0 }
  validates :quantity, presence:true, numericality: { greater_or_equal_to: 0 }
  validates :total_price, presence:true, numericality: { greater_or_equal_to: 0 }

  #def self.statuses
  #  return STATUSES
  #end
end
