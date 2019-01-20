class Admin::RolesController < AdminController
	before_action :set_role, only: [:show, :edit, :update, :destroy]

	def index
		@roles = Role.all
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

	def set_role
		@role = Role.find(params[:id])
	end

	def role_params
		params.require(:role).permit(:name)

	end

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
