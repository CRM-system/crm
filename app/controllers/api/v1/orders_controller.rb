class Api::V1::OrdersController < ApiController
  skip_before_action :verify_authenticity_token

  def create
    product = Product.find(params[:product_id])
    order = Order.new(order_params)

    order.update(
      product_id: product.id,
      client_email: 'Неизвестно',
      client_addres: 'Выяснить',
      order_price: 0,
      quantity: 0,
      total_price: 0
    )

    if order.save
      render json: order, status: 201
    else
      render json: { errors: order.errors }, status: 422
    end
  end

  private

  def order_params
    params.require(:order).permit(:client_name, :client_phone)
  end
end
