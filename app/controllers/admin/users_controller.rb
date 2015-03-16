class Admin::UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :check_admin_status?

	def index
		@users = User.order("id ASC").paginate(:page => params[:page], :per_page => 10)
	end

	def show
		@users = User.find(params[:id])
		@username = @users.username
	end

	private
	  def check_admin_status?
	  	if current_user.admin?
	  		return
	  	else
	  		redirect_to root_path, notice: "You do not have permission to do that"
	  	end
	  end
end
