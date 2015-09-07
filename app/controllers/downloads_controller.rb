class DownloadsController < ApplicationController
  def index
    @map_downloads = MapDownload.all
  end
end
