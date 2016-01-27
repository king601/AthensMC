class WhitelistRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_minecraft_uuid?

  def index
    @whitelist_request = WhitelistRequest.new
  end

  def new
  end

  def create
    @whitelist_request = current_user.build_whitelist_request(whitelist_request_params)

    @whitelist_request.status = 'pending'
    if @whitelist_request.save
      redirect_to root_path, notice: "You've submitted your request to join. You should receive an email in 24-48 hours with a response."
      # WhitelistMailer.request_received(current_user).deliver_later
      SlackNotifierJob.perform_later(@whitelist_request)
    else
      render 'index', alert: 'An error occurred while submitting your request. Please try again.'
    end
  end

  private

  def whitelist_request_params
    params.require(:whitelist_request).permit(:status, :agree_rules, :referred_by)
    end
end
