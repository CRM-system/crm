class Admin::ProductsController < AdminController
  before_action :check_access_index_product, :only => [:index]
  before_action :check_access_show_product, :only => [:show]

  before_action :find_product, only:[:show, :edit, :update, :destroy]

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

  private

  def product_params
    params.require(:product).permit(:name, :price, :description)
  end

  def find_product
    @product = Product.find(params[:id])
  end

  def upload_picture
   @product.picture.attach(uploaded_file) if uploaded_file.present?
  end

  def uploaded_file
  params[:product][:picture]
  end

  def check_access_index_product
    redirect_to request.referrer unless current_worker.index_product_access_is_given?
  end

  def check_access_show_product
    redirect_to request.referrer unless current_worker.show_product_access_is_given?
  end

end
