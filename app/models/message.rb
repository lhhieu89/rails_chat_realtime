class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user

  validates_presence_of :body, :conversation_id, :user_id

  scope :new_messages, -> (sender_id, user_id) do
    where("user_id = ? AND recipient_id = ? AND viewed = ?", sender_id, user_id, 0)
  end
end
