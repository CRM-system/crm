class Admin::ProductsController < AdminController
  before_action :check_access_index_product, :only => [:index]
  before_action :check_access_show_product, :only => [:show]
  before_action :check_access_edit_product, :only => [:edit]
  before_action :check_access_new_product, :only => [:new]
  before_action :check_access_duplicate_product, :only => [:duplicate]
  before_action :find_product, only:[:show, :edit, :update, :destroy, :duplicate]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      upload_picture
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
    new_product = @product.dup

    Product.new(
      name: "#{new_product.name}",
      description: "#{new_product.description}",
      price: new_product.price
    )

    new_product.picture.attach(@product.picture.blob)

    new_product.save

    redirect_to admin_products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :picture)
  end

  def find_product
    @product = Product.find(params[:id])
  end

  def check_access_index_product
    redirect_to request.referrer unless current_worker.index_product_access_is_given?
  end

  def check_access_show_product
    redirect_to request.referrer unless current_worker.show_product_access_is_given?
  end

  def check_access_edit_product
    redirect_to request.referrer unless current_worker.edit_product_access_is_given?
  end

  def check_access_new_product
    redirect_to request.referrer unless current_worker.new_product_access_is_given?
  end

  def check_access_duplicate_product
    redirect_to request.referrer unless current_worker.duplicate_product_access_is_given?
  end

end
