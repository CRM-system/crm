class Worker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise    :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable
	validates :nickname, presence: true, length: { maximum: 50 }
	belongs_to :role

  def create_worker_access_is_given?
    if function_is_present?('worker', 'create')
      return_access('worker', 'create')
    end
  end

  def index_product_access_is_given?
    if function_is_present?('product', 'index')
      return_access('product', 'index')
    end
  end

  def show_product_access_is_given?
    if function_is_present?('product', 'show')
      return_access('product', 'show')
    end
  end

  def edit_product_access_is_given?
    if function_is_present?('product', 'edit')
      return_access('product', 'edit')
    end
  end

  def new_product_access_is_given?
    if function_is_present?('product', 'new')
      return_access('product', 'new')
    end
  end

  def duplicate_product_access_is_given?
    if function_is_present?('product', 'duplicate')
      return_access('product', 'duplicate')
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
