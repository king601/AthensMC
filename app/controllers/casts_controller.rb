class CastsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :check_admin_status, :only => [:new, :edit, :create, :destroy, :update]

	def index
		@cast = Cast.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
		@cast_latest = Cast.last

	end

	def show
		@cast = Cast.find(params[:id])
	end

	def create
		#render plain: params[:cast].inspect
		@cast = current_user.casts.build(casts_params)

		if @cast.save
			redirect_to @cast
		else
			render 'new'
		end
	end

	def new
		@last_cast = Cast.last

		@cast = current_user.casts.build
	end

	def edit
		@cast = Cast.find(params[:id])
	end

	def update
		@cast = Cast.find(params[:id])

		if @cast.update(casts_params)
			redirect_to @cast
		else
			render 'edit'
		end

	end

	def destroy
	end

	def suggest
		render plain: "Hello Suggestions"
	end

	private
	def suggestion_params
		params.require(:suggestion).permit(:suggestion_text)
	end

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
