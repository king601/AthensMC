class CastsController < ApplicationController
	before_action :authenticate_user!, except: [:index]
	before_action :check_admin_status, :only => [:new, :edit, :create, :destroy, :update]

	def index
	end

	def show
	end

	def new
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def check_admin_status
		authenticate_user!

		if current_user.admin
			return
		else
			redirect_to casts_path, notice: "You do not have permission to do that"
		end
	end

end