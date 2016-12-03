class Admin::WhitelistRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin_status?
  before_action :set_whitelist_id, only: [:approve, :deny, :destroy]

  def index
    @whitelist_requests = Admin::WhitelistRequestDecorator.decorate_collection(
      WhitelistRequest.order('created_at DESC')
    )
  end

  def charts
    @whitelist_requests_chart = WhitelistRequest.current_month.group_by_day(:created_at).count
    @whitelist_requests_by_status = WhitelistRequest.current_month.group(:status).group_by_week(:created_at).count
    @last_month_chart = WhitelistRequest.last_month.group_by_day(:created_at).count
  end

  def pending
    @whitelist_requests =  Admin::WhitelistRequestDecorator.decorate_collection(
      WhitelistRequest.status('pending').order('created_at DESC')
    )
    render action: :index
  end

  def approved
    @whitelist_requests =  Admin::WhitelistRequestDecorator.decorate_collection(
      WhitelistRequest.status('approved').order('created_at DESC')
    )
    render action: :index
  end

  def denied
    @whitelist_requests =  Admin::WhitelistRequestDecorator.decorate_collection(
      WhitelistRequest.status('denied').order('created_at DESC')
    )
    render action: :index
  end

  def show
    @whitelist_request = WhitelistRequest.find(params[:id]).decorate
  end

  # For Approving Whitelist Requests via patch
  def approve
    @whitelist_request.update_attributes(approved_on: Time.now, status: 'approved')
    redirect_to admin_whitelist_requests_path, notice: "#{@whitelist_request.user.username}'s application has been approved!"
    WhitelistMailer.request_approved(@whitelist_request).deliver_later
  end

  # For denying whitelist requests via a patch method
  def deny
    @whitelist_request.update_attributes(denied_on: Time.now, status: 'denied')
    redirect_to admin_whitelist_requests_path, notice: "#{@whitelist_request.user.username}'s application has been denied!"
    WhitelistMailer.request_denied(@whitelist_request).deliver_later
  end

  def destroy
    WhitelistMailer.request_removed(@whitelist_request).deliver_later
    @whitelist_request.destroy
    redirect_to admin_whitelist_requests_path, notice: 'Whitelist Request Destroyed'
  end

  private

  def set_whitelist_id
    @whitelist_request = WhitelistRequest.find_by_id(params[:format])
  end
end
