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

	def whitelisted
		@users = User.joins(:whitelist_request).where('whitelist_requests.status IN (?)', 'approved').references(:whitelist_request)
		respond_to do |format|
			format.html { redirect_to admin_whitelist_requests_path, alert: "Sorry only a JSON file is supported here" }
			format.json 
		end
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
