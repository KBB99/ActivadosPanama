class StaticPagesController < ApplicationController
  def home
    if logged_in?
      if current_user.admin
        redirect_to conversations_url
        return
      else
        @conversation = current_user.conversations.last
      end
    else
      @user = User.new
      @user.username = 'Usted'
      @user.password = 'password'
      @user.password_confirmation = 'password'
      @user.save
      log_in(@user)
      remember(@user)
      @conversation = @user.conversations.new
      @conversation.online = true
      @conversation.save
    end
    @message = @conversation.messages.new
  end
end
