class DownloadsController < ApplicationController
  before_action :authenticate_user!

  def index
    @map_downloads = MapDownload.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end
end
