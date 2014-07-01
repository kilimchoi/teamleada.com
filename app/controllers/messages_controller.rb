class MessagesController < ApplicationController
  load_and_authorize_resource

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    if @message.save
      redirect_to conversation_path(@message.conversation)
    else
      redirect_to conversation_path(@message.conversation)
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :conversation_id)
  end

end
