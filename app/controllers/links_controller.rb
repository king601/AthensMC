class LinksController < ApplicationController
	before_action :authenticate_user!
	before_action :check_uuid, :only => [:create]
	def minecraft
		@user = current_user
	end

	def create
		if current_user.update(user_params)
			redirect_to root_path, notice: "Successfully saved your Minecraft account!"
		else
			if !current_user.update(user_params)
				redirect_to links_minecraft_path, alert: "An error occurred while looking up your Minecraft UUID, please try again!  
				Make sure you double check your spelling.. In addition the Minecraft account cannot already be associated with an account."
			end
		end
	end

	private
		def user_params
			params.require(:user).permit(:minecraft_uuid)
		end

		def check_uuid
			if (:minecraft_uuid).nil?
				flash[:alert] = "You need to fill out the Minecraft UUID"
				redirect_to links_minecraft_path
			end
		end
end
