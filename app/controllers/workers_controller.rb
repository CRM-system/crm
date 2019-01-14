class WorkersController < ApplicationController

  before_action :correct_worker, only: [:edit, :update]

  def index
  	@workers = Worker.all
  end

  def show
  	@worker = Worker.find(params[:id])
  end

  private

  def correct_worker
    @worker = Worker.find(params[:id])
    redirect_to(root_url) unless current_worker?(@worker)
  end

end
