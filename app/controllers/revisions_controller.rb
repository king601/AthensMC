class RevisionsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_filter :check_admin_status, :only => [:new, :edit, :create, :destroy, :update] 

	def index
		@revision = Revision.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
	end

	def show
		@revision = Revision.find(params[:id])
	end

	def create
		#render plain: params[:revision].inspect
		@revision = Revision.new(revision_params)

		if @revision.save
			redirect_to @revision
		else
			render 'new'
		end
	end

	def new
		@revision = Revision.new
	end

	def edit
		@revision = Revision.find(params[:id])
	end

	def update
		@revision = Revision.find(params[:id])

		if @revision.update(revision_params)
			redirect_to @revision
		else
			render 'edit'
		end
	end

	def destroy
		@revision = Revision.find(params[:id])
		@revision.destroy

		redirect_to revisions_path
	end

	private

	def revision_params
		params.require(:revision).permit(:title, :text)
	end

	def check_admin_status
		authenticate_user!

		if current_user.admin
			return
		else
			redirect_to changes_path, notice: "You do not have permission to do that"
		end
	end

end
