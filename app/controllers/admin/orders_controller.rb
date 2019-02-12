class Admin::OrdersController < AdminController
  before_action :check_access_create_order, :only => [:new]
  before_action :check_access_index_order, :only => [:index]
  before_action :check_access_edit_order, :only => [:edit]
  before_action :check_access_destroy_order, :only => [:destroy]
  before_action :set_order, only: [:edit, :show, :update, :destroy]

  

  def count_total_price
    @order.total_price = @order.quantity * @order.order_price
    @order.save
  end

  # def change_status_from_new_to_refused
  #   @order = Order.find(params[:id])
  #   @order.update(status: :refused)
  #   redirect_to admin_orders_path
  # end

  # def change_status
  #     @order = Order.find(params[:id])
  #     @order = Order.update(status: params[:status])
  # end

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
    @order.total_price = @order.quantity * @order.product.price
    if @order.update(order_params)
      count_total_price
      redirect_to admin_orders_path
    else
      render :edit
    end
  end

  def index
    if params[:status]
      @orders = Order.where(status: params[:status])
    else
      @orders = Order.all      
    end    
  end

  # def check_params
  #   @orders = Order.where(nil)
  #   filtering_params(params).each do |key, value|
  #     @order = @order.public_send(key, value) if value.present?
  #   end
  #   render :index
  # end

  def check_params
    if params[:client_name]
      @orders = Order.search_all(
        params[:client_name]       
      )
    elsif params[:delivery_type]
      @orders = Order.search_all(delivery_type: params[:delivery_type])
    elsif params[:product_id]
      @orders = Order.search_product(product_id: params[:product_id])
    elsif params[:created_at]
      @orders = Order.search_by_date(:order_id => order_ids, ordertable_type => ordertable)
    end
    render :index
  end

  def show
  end

  def destroy
    @order.destroy
    redirect_to admin_orders_path
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:client_name, :client_phone, :client_email,
      :client_addres, :delivery_type, :order_price,
      :quantity, :total_price, :status, :product_id)
  end

  # def filtering_params(params)
  #   params.slice(:client_name, :client_phone, :client_addres)
  # end

  def check_access_create_order
    redirect_to request.referrer unless current_worker.create_order_access_is_given?
  end

  def check_access_index_order
    redirect_to request.referrer unless current_worker.index_order_access_is_given?
  end

  def check_access_destroy_order
    redirect_to request.referrer unless current_worker.destroy_order_access_is_given?
  end

  def check_access_edit_order
    redirect_to request.referrer unless current_worker.edit_order_access_is_given?
  end
end
