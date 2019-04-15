class RoomChannel < ApplicationCable::Channel

  def subscribed
    stream_from "room_channel"
    conversation = current_user.conversations.last
    unless conversation.online OR current_user.admin
      ActionCable.server.broadcast 'room_channel',
        conversation: current_user.conversations.last.id,
        online: true
      conversation.online = true
      conversation.save
    end
  end

  def unsubscribed
    s = current_user.conversations.last
    ActionCable.server.broadcast 'room_channel',
      conversation: current_user.conversations.last.id,
      online: false
    # Any cleanup needed when channel is unsubscribed
    s.online = false
    s.save
  end

end
