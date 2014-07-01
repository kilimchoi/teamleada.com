class ConversationsController < ApplicationController
  load_and_authorize_resource

  def index
    @conversations = current_user.conversations
  end

  def show
    @message = Message.new
  end

  def new
    @conversation.messages.build
  end

  def create
    @conversation = Conversation.new(conversation_params)
    @conversation.starter = current_user
    if @conversation.save
      redirect_to conversation_path(@conversation)
    else
      redirect_to conversation_path(@conversation)
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:title, { messages_attributes: [:id, :user_id, :content, :is_draft] })
  end

end
