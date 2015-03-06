class CastsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :check_admin_status, :only => [:new, :edit, :create, :destroy, :update]

	def index
		@cast = Cast.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
	end

	def show
		@cast = Cast.find(params[:episode])
	end

	def create
		render plain: params[:cast].inspect
	end

	def new
		@cast = current_user.casts.build
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	
	def casts_params
		params.require(:cast).permit(:episode, :releasedate, :description, :embedcode)
	end

	def check_admin_status
		authenticate_user!

		if current_user.admin
			return
		else
			redirect_to casts_path, notice: "You do not have permission to do that"
		end
	end

end