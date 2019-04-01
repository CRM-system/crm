class Worker < ApplicationRecord

  devise    :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable
	validates :nickname, presence: true, length: { maximum: 50 }
	belongs_to :role
  has_many :comments

  def access_is_given?(model, action)
    if function_is_present?(model, action)
      return_access(model, action)
    end
  end

  def find_function(model, name)
    self.role.functions.where(model: model, name: name).first
  end

  def function_is_present?(model, name)
    self.find_function(model, name).present?
  end

  def return_access(model, name)
    find_function(model, name).access
  end
end
