class Product < ApplicationRecord

  has_many :functions, as: :functionable

end
