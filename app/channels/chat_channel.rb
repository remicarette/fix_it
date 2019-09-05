class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "booking_channel_#{params[:booking_id]}"
  end
end
