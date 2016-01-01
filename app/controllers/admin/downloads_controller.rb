class Admin::DownloadsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin_status?
	before_action :set_map_download, only: [:edit, :update, :destroy]

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

  def update
    if @map_download.update(map_download_params)
			redirect_to admin_downloads_path, notice: "Download has been updated!"
		else
			render 'edit'
		end
  end

  def edit
  end

  def destroy
    @map_download.destroy
    redirect_to admin_downloads_path, notice: "Download has been removed from the site."
  end

  private
    def set_map_download
      @map_download = MapDownload.find(params[:id])
    end

    def map_download_params
      params.require(:map_download).permit(:name, :description, :link)
    end
end
