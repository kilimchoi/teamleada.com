class ConversationsController < ApplicationController
  load_and_authorize_resource
  autocomplete :user, :name, full: true, display_value: :search_name, extra_data: [:username]

  def autocomplete_user_name
    render json: current_user.allowed_contacts.map{ |user| {
      label: user.name,
      id: user.id,
    }}
  end

  def index
    @conversations = current_user.conversations.paginate(page: params[:page])
  end

  def show
    @conversation.mark_as_read(current_user)
    @message = Message.new
  end

  def new
    @conversation.messages.build
  end

  def create
    @conversation = Conversation.new(conversation_params)
    valid = @conversation.add_users_from_search(params[:recipients])
    if !valid
      flash[:danger] = "There was a problem creating your message."
      redirect_to new_conversation_path
      return
    end
    ConversationUser.create(user: current_user, conversation: @conversation, unread: false)
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
