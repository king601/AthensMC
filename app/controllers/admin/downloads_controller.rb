class Admin::DownloadsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin_status?

  def index
  end
end
