class Message < ApplicationRecord
  belongs_to :sender,   class_name: "User"
  belongs_to :receiver, class_name: "User"

  validates :content, length: { maximum: 100  }

  def conversation
    conversation = Message.where(sender: self.sender, receiver: self.receiver) + Message.where(sender: self.receiver, receiver: self.sender)
    @messages = conversation.sort_by { |message| message.created_at }
  end
end
