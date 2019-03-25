class Worker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise    :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable
	validates :nickname, presence: true, length: { maximum: 50 }
	belongs_to :role
  has_many :comments

  def index_landing_access_is_given?
    if function_is_present?('landing', 'index')
      return_access('landing', 'index')
    end
  end

  def edit_landing_access_is_present?
    if function_is_present?('landing', 'edit')
      return_access('landing', 'edit')
    end
  end

  def show_landing_access_is_present?
    if function_is_present?('landing', 'show')
      return_access('landing', 'show')
    end
  end

  def new_landing_access_is_given?
    if function_is_present?('landing', 'new')
      return_access('landing', 'new')
    end
  end

  def destroy_landing_access_is_given?
    if function_is_present?('landing', 'destroy')
      return_access('landing', 'destroy')
    end
  end

  def index_order_access_is_given?
    if function_is_present?('order', 'index')
      return_access('order', 'index')
    end
  end

  def edit_order_access_is_given?
    if function_is_present?('order', 'edit')
      return_access('order', 'edit')
    end
  end

  def new_order_access_is_given?
    if function_is_present?('order', 'new')
      return_access('order', 'new')
    end
  end

  def destroy_order_access_is_given?
    if function_is_present?('order', 'edit')
      return_access('order', 'destroy')
    end
  end

  def index_role_access_is_given?
    if function_is_present?('role', 'index')
      return_access('role', 'index')
    end
  end

  def edit_role_access_is_given?
    if function_is_present?('role', 'edit')
      return_access('role', 'edit')
    end
  end

  def new_role_access_is_given?
    if function_is_present?('role', 'new')
      return_access('role', 'new')
    end
  end

  def destroy_role_access_is_given?
    if function_is_present?('role', 'destroy')
      return_access('role', 'destroy')
    end
  end

  def index_worker_access_is_given?
    if function_is_present?('worker', 'index')
      return_access('worker', 'index')
    end
  end

  def create_worker_access_is_given?
    if function_is_present?('worker', 'create')
      return_access('worker', 'create')
    end
  end

  def destroy_worker_access_is_given?
    if function_is_present?('worker', 'destroy')
      return_access('worker', 'destroy')
    end
  end

  def edit_worker_access_is_given?
    if function_is_present?('worker', 'edit')
      return_access('worker', 'edit')
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

  def destroy_product_access_is_given?
    if function_is_present?('product', 'destroy')
      return_access('product', 'destroy')
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
