class Admin::ProductsController < AdminController
  before_action :check_access_index_product, :only => [:index]
  before_action :check_access_show_product, :only => [:show]
  before_action :check_access_edit_product, :only => [:edit]
  before_action :check_access_new_product, :only => [:new]
  before_action :check_access_duplicate_product, :only => [:duplicate]
  before_action :check_access_destroy_product, :only => [:destroy]

  before_action :find_product, only:[:show, :edit, :update, :destroy, :duplicate]

  def index
    @products = Product.all.paginate(:page => params[:page], :per_page => 5)
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_product_path(@product)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @product.update(product_params)

    redirect_to admin_product_path(@product)
  end

  def destroy
    @product.destroy

    redirect_to admin_products_path
  end

  def duplicate
    duplicated_product = @product.dup

    if @product.picture.attached?
      duplicated_product.picture.attach(@product.picture.blob)
    end

    duplicated_product.save

    redirect_to admin_products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :picture, :landing_id)
  end

  def find_product
    @product = Product.find(params[:id])
  end

  def check_access_index_product
    redirect_to admin_root_path unless current_worker.access_is_given?('product', 'index')
  end

  def check_access_show_product
    redirect_to admin_root_path unless current_worker.access_is_given?('product', 'show')
  end

  def check_access_edit_product
    redirect_to admin_root_path unless current_worker.access_is_given?('product', 'edit')
  end

  def check_access_new_product
    redirect_to admin_root_path unless current_worker.access_is_given?('product', 'new')
  end

  def check_access_duplicate_product
    redirect_to admin_root_path unless current_worker.access_is_given?('product', 'duplicate')
  end

  def check_access_destroy_product
    redirect_to admin_root_path unless current_worker.access_is_given?('product', 'destroy')
  end

end
