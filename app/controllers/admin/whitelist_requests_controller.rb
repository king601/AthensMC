class Admin::WhitelistRequestsController < ApplicationController
  	before_action :authenticate_user!
    before_action :check_admin_status?

    def index
      @whitelist_requests = WhitelistRequest.order("created_at DESC")
      respond_to do |format|
        format.html
        format.json { render :json => @whitelist_requests }
      end
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
      @whitelist_request = WhitelistRequest.find_by_id(params[:format])
      @whitelist_request.update_attributes(:approved_on => Time.now, :status => "approved")
      redirect_to admin_whitelist_requests_path, notice: "Request Approved!"
    end
    # For denying whitelist requests via a patch method
    def deny
      @whitelist_request = WhitelistRequest.find_by_id(params[:format])
      @whitelist_request.update_attributes(:denied_on => Time.now, :status => "denied")
      redirect_to admin_whitelist_requests_path, notice: "Request Denied!"
    end

    def whitelist
      @whitelist_requests = WhitelistRequest.order("created_at DESC").status("approved")
      render :json => @whitelist_requests
    end
    private
      def check_admin_status?
        if current_user.admin?
          return
        else
          redirect_to root_path, alert: "You do not have permission to do that"
        end
      end
end
