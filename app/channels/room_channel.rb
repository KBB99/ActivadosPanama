class RoomChannel < ApplicationCable::Channel

  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    s = current_user.conversations.last
    s.online = false
    ActionCable.server.broadcast 'room_channel',
      conversation: current_user.conversations.last.id,
      online: false
    # Any cleanup needed when channel is unsubscribed
  end

end
