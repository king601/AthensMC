class DownloadsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @map_downloads = MapDownload.all
  end
end
