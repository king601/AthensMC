class LinksController < ApplicationController
	before_action :authenticate_user!

	def minecraft
		@user = current_user
	end

	def create
		if current_user.update(user_params)
			# Did the user enter in the UUID? IF so save it.
			if !current_user[:minecraft_uuid].nil?
				redirect_to whitelist_requests_path, notice: "Successfully saved your Minecraft account! If you have not already done so, you may apply for the server now."
			end
			if current_user[:minecraft_uuid].nil?
				redirect_to links_minecraft_path, alert: "You need to enter a Minecraft Username"
			end
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


end
