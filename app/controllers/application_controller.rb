class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :user_signed_in_is_whitelisted?
  def user_signed_in_is_whitelisted?
    user_signed_in? && current_user.whitelisted?
  end

  private
    def check_minecraft_uuid?
      # Check that the Minecraft UUID for the user isn't nil, if it is make them fill it out
      unless current_user.minecraft_uuid
        flash[:alert] = "We need you to link a Minecraft Account before allowing you to continue."
        redirect_to links_minecraft_path
      end
    end

    def check_admin_status?
      if current_user.admin?
        return
      else
        redirect_to root_path, alert: "You do not have permission to do that"
      end
    end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
    end

end
