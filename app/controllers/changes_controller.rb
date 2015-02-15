class ChangesController < ApplicationController
	before_action :authenticate_user!, except: [:index]
	before_filter :check_admin_status, :only => [:new, :edit, :create, :destroy, :update] 

	def index
		@changes = Changes.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
	end

	def show
		@changes = Changes.find(params[:id])
	end

	def create
		#render plain: params[:changes].inspect
		@changes = Changes.new(changes_params)

		if @changes.save
			redirect_to @changes
		else
			render 'new'
		end
	end

	def new
		@changes = Changes.new
	end

	def edit
		@changes = Changes.find(params[:id])
	end

	def update
		@changes = Changes.find(params[:id])

		if @changes.update(changes_params)
			redirect_to @changes
		else
			render 'edit'
		end
	end

	def destroy
		@changes = Changes.find(params[:id])
		@changes.destroy

		redirect_to changes_path
	end

private
	def changes_params
		params.require(:changes).permit(:title, :text)
	end

	def check_admin_status
		authenticate_user!

		if current_user.admin
			return
		else
			redirect_to changes_path, notice: "You don't have permission to do that"
		end
	end

end
