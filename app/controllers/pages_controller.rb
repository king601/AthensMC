class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:stats]
  # layout('new')

  def home
  end

  def stats
    @users = User.all
    @revisions = Revision.all
    @casts = Cast.all
    @whitelist_requests = WhitelistRequest.status('approved')
  end
end
