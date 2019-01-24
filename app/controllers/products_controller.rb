class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
  end

  def send_to_order
    @product = Product.find(params[:id])
    @order = Order.create!(
      product_id: @product.id,
      delivery_type: 'Выяснить',
      client_name: 'Выяснить',
      client_addres: 'Выяснить',
      order_price: 0,
      quantity: 0,
      total_price: 0
    )

    redirect_to @product
  end

  def index
    @products = Product.all
  end

end
