class Admin::WorkersController < AdminController
	before_action :create_worker_access_is_given?, :only => [:new], if: :functions_exist?

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
		@worker.destroy
		redirect_to admin_workers_path
	end

	private

	def set_worker
		@worker = Worker.find(params[:id])
	end

	def worker_params
		params.require(:worker).permit(:nickname, :email, :password, :role_id)
	end

	def create_worker_access_is_given?
	    redirect_to request.referrer unless Function.find(
	    	current_worker.role.functions.where(
	    		model: 'worker', name: 'create'
	    	).ids.first
	    ).access
	end

	def functions_exist?
		current_worker.role.functions.exists?
	end
end
