# frozen_string_literal: true

# DownloadsController
class DownloadsController < ApplicationController
  before_action :authenticate_user!

  def index
    @map_downloads = MapDownload.descending.
      paginate(page: params[:page], per_page: (params[:limit] || 10))
  end
end
