class Admin::OrdersController < AdminController
  before_action :set_order, only: [:edit, :show, :update, :destroy]
  before_action :count_total_price, only: [ :update]
  before_action :make_processed, only: [ :update]
  def index
      @orders = Order.all
  end

  def edit
  end

  def count_total_price
    @order = Order.find(params[:id])
    @order.update(:total_price => (@order.quantity * @order.order_price))
  end

  def make_processed
    @order.status = :processed
    @order.save
  end

  def update
    if @order.update(order_params)
      redirect_to admin_orders_path
    else
      render :edit
    end
  end

  def change_status_from_new_to_refused
    @order = Order.find(params[:id])
    @order.update(status: :refused)
    redirect_to admin_orders_path
  end

  def show
  end

  def destroy
      @order.destroy
      redirect_to admin_orders_path
  end

  def get_orders_by_status_params
      @orders = Order.where(status: params[:status])
      redirect_to admin_orders_path
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:client_name, :client_phone, :client_email,
                                  :client_addres, :delivery_type, :order_price,
                                  :quantity, :product_id)
  end
end
