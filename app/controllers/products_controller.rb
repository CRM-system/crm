class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
    @order = Order.new(product_id: @product.id)
  end

  def index
    @products = Product.all
  end

end
