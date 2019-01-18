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

  def index_product_access_is_given?
    if self.role.functions.exists?
      self.role.functions.where(model: 'product', name: 'index').first.access
    end
  end

  def show_product_access_is_given?
    if self.role.functions.exists?
      self.role.functions.where(model: 'product', name: 'show').first.access
    end
  end

  def edit_product_access_is_given?
    if self.role.functions.exists?
      self.role.functions.where(model: 'product', name: 'edit').first.access
    end
  end

  def new_product_access_is_given?
    if self.role.functions.exists?
      self.role.functions.where(model: 'product', name: 'new').first.access
    end
  end
end
