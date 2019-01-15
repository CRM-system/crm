class WorkersController < ApplicationController

  before_action :correct_worker, only: [:edit, :update]

  def index
  	@workers = Worker.all
  end

  def create
    @worker = Worker.new(worker_params)
    @worker.save

    redirect_to root_path
  end
  
  def show
  	@worker = Worker.find(params[:id])
  end

  private

  def worker_params
    params.require(:worker).permit(:nickname, :email, :password)
  end

  def correct_worker
    @worker = Worker.find(params[:id])
    redirect_to(root_url) unless current_worker?(@worker)
  end

end
