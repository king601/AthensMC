class ChangesController < ApplicationController
	def index
		@changes = Changes.order("created_at DESC")
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

private
	def changes_params
		params.require(:changes).permit(:title, :text)
	end

end
