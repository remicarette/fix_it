class ProgressBarChannel < ApplicationCable::Channel
  def subscribed
    stream_from "progress_channel_#{params[:booking_id]}"
  end
end
