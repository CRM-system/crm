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
  has_many :comments

  pg_search_scope :search_all, :against =>
                                  [
                                    :client_phone,
                                    :client_email,
                                    :client_addres,
                                    :order_price,
                                    :quantity,
                                    :total_price
                                  ],
                                  :using => {
                                    :tsearch => {:prefix => true}
                                  }
  pg_search_scope :search_by_name, :against => [:client_name],
                                          :using => {
                                            :tsearch => {:prefix => true}
                                          }

  # pg_search_scope :search_product, :associated_against => {:product => :name}

  # pg_search_scope :search_by_name, :against => :client_name
  # pg_search_scope :search_by_phone, :against => :client_phone
  # pg_search_scope :search_by_email, :against => :client_email
  # pg_search_scope :search_by_addres, :against => :client_addres
  # pg_search_scope :search_by_date, :against => :created_at
  # pg_search_scope :search_product, :associated_against => {:product => :name}

  # def self.search(query, *args)
  #   search_by(query, :client_name => client_name, :client_phone => client_phone,
  #     :client_email => client_email, :client_addres => client_addres, :created_at => created_at)
  # end

  # pg_search_scope :simple_search, (lambda do
  #   return { :against => args, :query => query }
  # end)

  # def self.search_params(query, client_name, client_email, client_phone,
  #                         client_addres, delivery_type, created_at)
  #     simple_search(query, :client_name => client_name, :client_email => client_email,
  #        :client_phone => client_phone, :client_addres => client_addres,
  #        :delivery_type => delivery_type, :created_at => created_at)
  # end
  before_validation { client_name.capitalize! }
  #before_validation { client_email.downcase! }
  validates :client_name, presence: true, length: { maximum: 50 }
  validates :client_phone, presence: true, length: { maximum: 12 }
  #validates :client_email, format: { with: URI::MailTo::EMAIL_REGEXP },length: { maximum: 100 }
  validates :client_addres, presence: true, length: { maximum: 250 }
  validates :order_price, presence: true, numericality: { greater_or_equal_to: 0 }
  validates :quantity, presence:true, numericality: { greater_or_equal_to: 0 }
  validates :total_price, presence:true, numericality: { greater_or_equal_to: 0 }
end
