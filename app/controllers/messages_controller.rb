class MessagesController < ApplicationController
  before_action :get_messages

  def index
  end

  def create
    unless current_user.admin
      @conversation = current_user.conversations.last
      message = @conversation.messages.build(message_params)
      message.user_id = current_user.id
      message.save

      if @conversation.messages.count == 1
        ActionCable.server.broadcast 'room_channel',
                activated: true,
                content:  message.content,
                user: current_user.id,
                conversation: @conversation.id,
                username: current_user.username
      else
        ActionCable.server.broadcast 'room_channel',
                content:  message.content,
                user: current_user.id,
                conversation: @conversation.id,
                username: current_user.username
      end
    else
      @conversation = Conversation.find(params[:conversation_id])
      message = @conversation.messages.build(message_params)
      message.user_id = current_user.id
      if message.save
        ActionCable.server.broadcast 'room_channel',
          content:  message.content,
          user: current_user.id,
          conversation: @conversation.id,
          username: current_user.username
      end
    end
  end

  private

    def get_messages
      @messages = Message.for_display
      @message  = current_user.messages.build
    end

    def message_params
      params.require(:message).permit(:content)
    end
end
