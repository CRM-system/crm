class Admin::LandingsController < AdminController
  before_action :check_access_index_landing, :only => [:index]
  before_action :check_access_show_landing, :only => [:show]
  before_action :check_access_edit_landing, :only => [:edit, :update]
  before_action :check_access_new_landing, :only => [:new, :create]
  before_action :check_access_destroy_landing, :only => [:destroy]
  before_action :find_landing, only:[:show, :edit, :update, :destroy]
    def new
      @landing = Landing.new
    end

    def index
      @landings = Landing.all
    end

    def show
    end

    def create
      @landing = Landing.new(landing_params)
      if @landing.save
        redirect_to admin_landings_path
      else
      render :new
      end
    end

    def edit
    end

    def update
      if @landing.update(landing_params)
      redirect_to admin_landings_path(@landing)
    else
      render :edit
      end
    end

    def destroy
      @landing.destroy
      redirect_to admin_landings_path
    end

    private

    def landing_params
      params.require(:landing).permit(:name, :description, :address, :organization, :owner)
    end

    def find_landing
      @landing = Landing.find(params[:id])
    end

    def check_access_index_landing
      redirect_to admin_root_path unless current_worker.access_is_given?('landing', 'index')
    end

    def check_access_show_landing
      redirect_to admin_root_path unless current_worker.access_is_given?('landing', 'show')
    end

    def check_access_edit_landing
      redirect_to admin_root_path unless current_worker.access_is_given?('landing', 'edit')
    end

    def check_access_new_landing
      redirect_to admin_root_path unless current_worker.access_is_given?('landing', 'new')
    end

    def check_access_destroy_landing
      redirect_to admin_root_path unless current_worker.access_is_given?('landing', 'destroy')
    end
end
