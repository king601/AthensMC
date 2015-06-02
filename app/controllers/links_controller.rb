class LinksController < ApplicationController
	def minecraft
	end

	def create
		if current_user.update(user_params)
			redirect_to action: :minecraft, notice: "Successfully saved your Minecraft UUID"
		else
			redirect_to action: :minecraft, alert: "Please input a valid ID"
		end
	end

	private
		def user_params
			params.require(:user).permit(:minecraft_uuid)
		end
end
