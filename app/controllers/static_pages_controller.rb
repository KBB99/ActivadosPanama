class StaticPagesController < ApplicationController
  def home
    @messages = Message.for_display
    @message = Message.new
  end
end
