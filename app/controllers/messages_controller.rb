class MessagesController < ApplicationController
  before_action :logged_in_user
  before_action :get_messages

  def index
  end

  def create
    message = @conversation.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast 'room_channel',
                                   content:  message.content,
                                   username: message.user.username
    end
  end

  private

    def get_messages
      @messages = Message.for_display
      @message  = @current_user.messages.build
    end

    def logged_in_user
      @current_user = User.new
      @current_user.username = "Anónimo"
      @current_user.save
    end

    def message_params
      params.require(:message).permit(:content)
    end
end
