class Admin::OrdersController < AdminController
  before_action :set_order, only: [:edit, :show, :update, :destroy]

  def index
    if params[:status]
      @orders = Order.where(status: params[:status])
    else
      @orders = Order.all
    end
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to admin_orders_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @order.update(order_params)
      redirect_to admin_orders_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
      @order.destroy
      redirect_to admin_orders_path
  end

  # def get_orders_by_status_params
  #     @orders = Order.where(status: params[:status])
  #     redirect_to admin_orders_path
  # end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:client_name, :client_phone, :client_email,
                                  :client_addres, :delivery_type, :order_price,
                                  :quantity, :total_price, :status, :product_id)
  end
end
