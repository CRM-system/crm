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
  #   start_date =  params[:query][:start_date].to_date
  #   if params[:query][:end_date] == " "
  #     end_date == Date.today
  #   else
  #     end_date =  params[:query][:end_date].to_date
  #   end
  #   @orders = Order.where(created_at: start_date.beginning_of_day..Date.today.beginning_of_day)
  #   params[:query].tap{|param| param.delete(:start_date)}
  #   params[:query].tap{|param| param.delete(:end_date)}
  #   params[:query].each do |key, value|
  #     @orders = @orders.where(key => value) if value.present?
  #   end
  #   render :index
  # end

  def check_params
    # @orders = Order.all
    # @orders = @orders.where(product_id: params[:product_id]) unless params[:product_id].empty?
    # @orders = @orders.where(delivery_type: params[:delivery_type]) unless params[:delivery_type].empty?
    # @orders = @orders.where(client_name: params[:client_name]) unless params[:client_name].empty?
    # @orders = @orders.where('client_addres LIKE ? OR client_phone LIKE ? OR client_email LIKE ?',
    #   params[:client_info],
    #   params[:client_info],
    #   params[:client_info]
    # ).or(
    #   @orders.where(status: Order.statuses[params[:client_info]])
    # ) unless params[:client_info].empty?

    # render :index
    start_date = params[:query][:start_date].to_date
    end_date = get_end_date(params[:query])
    @orders = get_orders_by_date(start_date, end_date)
    search_by_type(params[:query].except(:start_date, :end_date))
    render :index
  end

  def get_end_date(params_query)
    if params[:query][:end_date] == String.new
      Date.today
    else
      params[:query][:end_date].to_date
    end
  end

  def get_orders_by_date(start_date, end_date)
    if start_date.present?
      return Order.where(created_at: start_date.beginning_of_day..end_date.beginning_of_day)
    else
      return Order.all
    end
  end

  def search_by_type(params_query)
    params_query.each do |search_type, search_type_value|
      if search_type == "search_all" && search_type_value.present?
        @orders = Order.search_all("#{params[:query][:search_all]}")
      else
        @orders = @orders.where(search_type => search_type_value) if search_type_value.present?
      end
    end

  end

  def show
    @order = Order.find(params[:id])
  end

  def destroy
    @order.destroy
    redirect_to admin_orders_path
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def return_params
    params[search_type, search_value].each do |key, value|
      @orders = @orders.where(key => value)
    end
  end

  def order_params
    params.require(:order).permit(:client_name,
      :client_phone,
      :client_email,
      :client_addres,
      :delivery_type,
      :order_price,
      :quantity,
      :total_price,
      :status,
      :product_id)
  end

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
