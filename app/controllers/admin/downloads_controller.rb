class Admin::DownloadsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin_status?

  def index
    @map_downloads = MapDownload.order("created_at DESC").paginate(:page => params[:page], :per_page => 15)
  end

  def create
    @map_download = MapDownload.new(map_download_params)

    if @map_download.save
      redirect_to admin_downloads_path, notice: "Download has been added!"
    else
      render 'new'
    end
  end

  def new
    @map_download = MapDownload.new
  end

  private
    def map_download_params
      params.require(:map_download).permit(:name, :description, :link)
    end
end
