class AdminController < ApplicationController
  layout 'admin'
  before_action :logged_in_worker
  # before_action :authenticate_admin!

end
