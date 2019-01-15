class Admin::ProductsController < ApplicationController
    before_action :find_product, only:[:show, :edit, :update, :destroy]

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to admin_product_path(product)
      else
        render 'new'
      end
    end

    def show
    end

    def index
      @products = Product.all
    end

    def edit
    end

    def update
      @product.update(product_params)

      redirect_to admin_product_path(product)
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
  end