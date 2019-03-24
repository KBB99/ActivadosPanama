class StaticPagesController < ApplicationController
  def home
    @user = User.new
    @user.username = 'Whatever'
    @user.save
    @conversation = @user.conversations.new
    @conversation.save
    @messages = @conversation.messages.for_display
    @message = @conversation.messages.new
  end
end
