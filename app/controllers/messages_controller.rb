class MessagesController < ApplicationController
  before_filter :authenticate_user!

  def create
    puts "=========="
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.build(message_params)
    @message.user_id = current_user.id
    @message.recipient_id = @conversation.recipient_id == current_user.id ? @conversation.sender_id : @conversation.recipient_id

    @message.save!

    Message.new_messages(@message.recipient_id, current_user.id).update_all(viewed: 1)

    @path = conversation_path(@conversation)
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end