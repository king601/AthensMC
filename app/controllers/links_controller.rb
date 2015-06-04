class LinksController < ApplicationController
	def minecraft
		@user = current_user
	end

	def create
		if current_user.update(user_params)
			redirect_to root_path, notice: "Successfully saved your Minecraft account!"
		else
			if !current_user.update(user_params)
				redirect_to links_minecraft_path, alert: "An error occurred while looking up your Minecraft UUID, please try again!  Make sure you double check your spelling."
			end
		end
	end

	private
		def user_params
			params.require(:user).permit(:minecraft_uuid)
		end
end
