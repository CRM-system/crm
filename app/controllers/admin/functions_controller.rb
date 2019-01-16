class Admin::FunctionsController < AdminController

  def index
    @functions = Function.all
  end


end
