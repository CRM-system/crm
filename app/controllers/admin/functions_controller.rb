class Admin::FunctionsController < AdminController

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
end
