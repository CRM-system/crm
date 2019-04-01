class Admin::RolesController < AdminController
	before_action :check_access_new_role, :only => [:new]
	before_action :check_access_index_role, :only => [:index]
	before_action :check_access_destroy_role, :only => [:destroy]
	before_action :check_access_edit_role, :only => [:edit]
	before_action :set_role, only: [:show, :edit, :update, :destroy]

	def index
		@roles = Role.all
		@roles_statuses = OrderStatus.all
	end

	def show
		@functions = Function.all.where(role_id: @role.id)
	end

	def new
		@role = Role.new
	end

	def edit
	end

	def create
		@role = Role.new(role_params)
		if @role.save
			add_functions_for(@role)
			set_functions_accesses_to_false(@role)
			redirect_to admin_roles_path
		else
			render :new
		end
	end

	def assign_status
		@role = Role.find(params[:id])
	end

	def update
		if @role.update(role_params)
			redirect_to admin_roles_path
		else
			render :edit
		end
	end

	def destroy
		@role.destroy
		redirect_to admin_roles_path
	end

	private

	def check_access_new_role
    	redirect_to admin_root_path unless current_worker.access_is_given?('role', 'new')
	end

	def check_access_edit_role
    	redirect_to admin_root_path unless current_worker.access_is_given?('role', 'edit')
	end

	def check_access_index_role
    	redirect_to admin_root_path unless current_worker.access_is_given?('role', 'index')
	end

	def check_access_destroy_role
    	redirect_to admin_root_path unless current_worker.access_is_given?('role', 'destroy')
	end

	def set_role
		@role = Role.find(params[:id])
	end

	def role_params
		params.require(:role).permit(:name, order_status_ids:[])
	end

	# def status_params
	# 	params.require(:order_status).permit(:title, :description)
	# end

	def add_functions_for(role)
		Function.all.each do |function|
			role.functions << function.dup
		end
	end

	def set_functions_accesses_to_false(role)
		role.functions.each do |function|
			function.update(access: false)
		end
	end
end
