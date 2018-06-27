module Conversations
  class MessagesController < ApplicationController
    before_action(:authenticate_user!)
    before_action(:set_conversation)

    def create
      @message = @conversation.messages.new(
        message_params.merge(user: current_user)
      )

      # authorize @message
      if @message.save
        # # Create Notifications for message
        # (@conversation.users.uniq - [current_user]).each do |user|
        #   Notification.create(
        #     recipient: user, actor: current_user,
        #     action: "posted", notifiable: @message
        #   )
        # end

        @conversation.update(last_message_content: @message.content)
        flash[:success] = 'Successfully created your message'
        redirect_to conversation_path(@conversation, anchor: "message_#{@message.id}")
      else
        flash[:alert] = 'Unable to save your post'
        redirect_to @conversation
      end
    end

    def destroy
      # You should only be able to destroy your own messsages
      @message = current_user.messages.find(params[:id])

      # authorize @message
      @message.destroy
      flash[:success] = 'Successfully removed that message.'
      redirect_to conversation_path(@conversation)
    end

    private

    def message_params
      params.require(:message).permit(:content)
    end

    def set_conversation
      @conversation = current_user.conversations.find(params[:conversation_id])
    end
  end
end
