class Admin::UsersController < ApplicationController
	before_action :authenticate_user!, except: [:whitelisted]
	before_action :check_admin_status?, except: [:whitelisted]

	def index
		#@users = User.order("id ASC").paginate(:page => params[:page], :per_page => 10)
		query = params[:q].presence || "*"
		@users = User.search query, misspellings: {below: 5}, page: params[:page], per_page: 10, suggest: true
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

	def autocomplete
		render json: User.search(
				params[:term],
				fields: [{username: :text_start}],
				limit: 10,
	      misspellings: {below: 5}
			).map(&:username)
	end

end
