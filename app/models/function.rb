class Function < ApplicationRecord
  before_validation :downcase

  belongs_to :role

  validates :name, presence: true, length: { maximum: 50 }
  validates :model, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 250 }
  validates_uniqueness_of :model, scope: [:name, :role_id]

  private
    def downcase
      model.downcase!
      name.downcase!
    end

end
