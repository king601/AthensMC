class LinksController < ApplicationController
	def minecraft
		@user = current_user
	end

	def create
		if current_user.update(user_params)
			redirect_to links_minecraft_path, notice: "Successfully saved your Minecraft UUID"
		else
			redirect_to links_minecraft_path, error: "An error occured and we could not save your Minecraft UUID"
		end
	end

	private
		def user_params
			params.require(:user).permit(:minecraft_uuid)
		end
end
