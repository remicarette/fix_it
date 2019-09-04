class Message < ApplicationRecord
  belongs_to :sender,   class_name: "User"
  belongs_to :receiver, class_name: "User"

  validates :content, length: { maximum: 100  }

  def conversation
    conversation = Message.where(sender: self.sender, receiver: self.receiver) + Message.where(sender: self.receiver, receiver: self.sender)
    @messages = conversation.sort_by { |message| message.created_at }
  end

  # def broadcast_message(booking)
  #     ActionCable.server.broadcast("booking_channel_#{booking.id}", {
  #       message: message
  #         partial: "bookings/chatbox",
  #         locals: {
  #           messages: self.conversation,
  #           user_pro: booking.pro,
  #           message: self
  #         })
  #     })
  # end

end
