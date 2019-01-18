class Worker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise    :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable
	validates :nickname, presence: true, length: { maximum: 50 }
	belongs_to :role

  def create_worker_access_is_given?
    if self.role.functions.exists?
      self.role.functions.where(model: 'worker', name: 'create').first.access
    end
  end
end
