class Order < ApplicationRecord
  include TranslateEnum
  include PgSearch

  enum status: [:new_order, :confirmed, :unconfirmed, :rejection, :find_out, :deferred,
                :assemblage, :prepared, :sent, :handed_in,
                :handed_and_paid, :return, :refund_received, :delivered,
                :reminder_1, :reminder_2, :wanted]

  enum delivery_type: [:courier, :mail, :self_delivery]

  translate_enum :status
  translate_enum :delivery_type

  belongs_to :product
  pg_search_scope :search_all, :against =>
                                  [:id, :client_name, :client_phone, :client_email,
                                  :client_addres, :delivery_type
                                  ],
                                  :using => {
                                    :tsearch => {:prefix => true}
                                  }

  pg_search_scope :search_by_delivery_type, against: [:delivery_type]
  pg_search_scope :search_by_client_name, against: [:client_name]
  pg_search_scope :search_by_delivery_type, against: [:delivery_type]


  # pg_search_scope :search_by_date, :against => :created_at

  before_validation { client_name.capitalize! }
  #before_validation { client_email.downcase! }
  validates :client_name, presence: true, length: { maximum: 50 }
  validates :client_phone, presence: true, length: { maximum: 12 }
  #validates :client_email, format: { with: URI::MailTo::EMAIL_REGEXP },length: { maximum: 100 }
  validates :client_addres, presence: true, length: { maximum: 250 }
  validates :order_price, presence: true, numericality: { greater_or_equal_to: 0 }
  validates :quantity, presence:true, numericality: { greater_or_equal_to: 0 }
  validates :total_price, presence:true, numericality: { greater_or_equal_to: 0 }


  # def self.search_by(*args)
  #   args.each do |search|
  #     return "serch_by_#{search}"
  #   end
    # проходимся по *args
    # для каждого вызываем метод
    # каждый элемент на итерации по *args будет передаваться в переменную field
    # search_by + _ + field

end
