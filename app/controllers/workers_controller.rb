class WorkersController < ApplicationController
  def index
  	@workers = Worker.all
  end

 def create
    @worker = Worker.new(worker_params)
    @worker.save

    redirect_to root_path

  end

  private

  def worker_params
  	params.require(:worker).permit(:nickname, :email, :password)

  end
end
