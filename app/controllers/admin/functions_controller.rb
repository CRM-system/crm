class Admin::FunctionsController < AdminController
  before_action :set_function, only: [:edit, :update, :destroy, :access]

  def index
    @functions = Function.all
  end

  def new
    @function = Function.new
  end

  def create
    @function = Function.new(function_params)
    if @function.save
      redirect_to [:admin, @function.role]
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @function.update(function_params)
      redirect_to [:admin, @function.role]
    else
      render :edit
    end
  end

  def destroy
    @function.destroy
    redirect_to [:admin, @function.role]
  end

  def access
    if @function.access
      @function.update(access: false)
    else
      @function.update(access: true)
    end

    redirect_to [:admin, @function.role]
  end

  private
    def function_params
      params.require(:function).permit(
        :name,
        :model,
        :description,
        :access,
        :role_id
      )
    end

    def set_function
      @function = Function.find(params[:id])
    end
end
