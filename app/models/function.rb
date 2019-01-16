class Function < ApplicationRecord
  belongs_to :role

  validates :name, presence: true, length: { maximum: 50 }
  validates :model, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 250 }
  validates_uniqueness_of :model, scope: :name

end
