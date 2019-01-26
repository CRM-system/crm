class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @product = Product.find(params[:product_id])
    @order = Order.new(order_params)

    @order.update(
      product_id: @product.id,
      delivery_type: 'Выяснить',
      client_addres: 'Выяснить',
      order_price: 0,
      quantity: 0,
      total_price: 0
    )

    if @order.save
      redirect_to product_path(@order.product)
    else
      render 'new'
    end
  end

  private
    def order_params
      params.require(:order).permit(:client_phone, :client_email, :client_name)
    end
end
