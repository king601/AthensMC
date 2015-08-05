class Admin::WhitelistRequestsController < ApplicationController
  	before_action :authenticate_user!
    before_action :check_admin_status?
    before_action :set_whitelist_id, only: [:approve, :deny]

    def index
      @whitelist_requests = WhitelistRequest.order("created_at DESC")
    end

    def pending
      @whitelist_requests = WhitelistRequest.status("pending")
      render action: :index
    end

    def approved
      @whitelist_requests = WhitelistRequest.status("approved")
      render action: :index
    end

    def denied
      @whitelist_requests = WhitelistRequest.status("denied")
      render action: :index
    end

    def show
      @whitelist_request = WhitelistRequest.find(params[:id])
    end
    # For Approving Whitelist Requests via patch
    def approve
      @whitelist_request.update_attributes(:approved_on => Time.now, :status => "approved")
      redirect_to admin_whitelist_requests_path, notice: "#{@whitelist_request.user.username}'s application has been approved!"
    end
    # For denying whitelist requests via a patch method
    def deny
      @whitelist_request.update_attributes(:denied_on => Time.now, :status => "denied")
      redirect_to admin_whitelist_requests_path, notice: "#{@whitelist_request.user.username}'s application has been denied!"
    end

    def destroy
      @whitelist_request.find(params[:id])

      @whitelist_request.destroy
      redirect_to admin_whitelist_requests_path, notice: "Whitelist Request Destroyed"
    end

    private
      def set_whitelist_id
        @whitelist_request = WhitelistRequest.find_by_id(params[:format])
      end

      def check_admin_status?
        if current_user.admin?
          return
        else
          redirect_to root_path, alert: "You do not have permission to do that"
        end
      end
end
