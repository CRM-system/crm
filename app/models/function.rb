class Function < ApplicationRecord
  belongs_to :functionable, polymorphic: true
  belongs_to :role
end
