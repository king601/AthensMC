class ConversationsController < ApplicationController
  before_action :authenticate_user!

  # List all the users conversations
  def index
    @conversations = current_user.conversations
  end

  def show
    @conversation = current_user.conversations.find(params[:id])
  end
end
