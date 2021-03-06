class Admin::WorkersController < AdminController
	before_action :check_access_create_worker, :only => [:new]
	before_action :check_access_index_worker, :only => [:index]
	before_action :check_access_destroy_worker, :only => [:destroy]
	before_action :check_access_edit_worker, :only => [:edit]

	before_action :set_worker, only: [:show, :edit, :update, :destroy]

	def index
		@workers = Worker.all
	end

	def show
	end

	def new
		@worker = Worker.new
	end

	def edit
	end

	def create
		@worker = Worker.new(worker_params)
		if @worker.save
			redirect_to admin_workers_path
		else
			render :new
		end
	end

	def update
		if @worker.update(worker_params)
			redirect_to admin_workers_path
		else
			render :edit
		end
	end

	def destroy
		@worker.destroy unless @worker.admin?
		redirect_to admin_workers_path
	end

	private

	def set_worker
		@worker = Worker.find(params[:id])
	end

	def worker_params
		params.require(:worker).permit(:nickname, :email, :password, :role_id)
	end

	def check_access_create_worker
    redirect_to admin_root_path unless current_worker.access_is_given?('worker', 'create')
	end

	def check_access_index_worker
    redirect_to admin_root_path unless current_worker.access_is_given?('worker', 'index')
	end

	def check_access_destroy_worker
    redirect_to admin_root_path unless current_worker.access_is_given?('worker', 'destroy')
	end

	def check_access_edit_worker
    redirect_to admin_root_path unless current_worker.access_is_given?('worker', 'edit')
	end
end
