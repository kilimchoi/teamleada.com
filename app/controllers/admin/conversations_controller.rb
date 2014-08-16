class Admin::ConversationsController < Admin::BaseController
  load_and_authorize_resource

  def index
    @conversations = @conversations.paginate(page: params[:page])
  end

  def show
  end

  def new
    @conversation.messages.build
  end

  def create
    @users = User.with_project_access
    if Conversation.create_separate_conversations(conversation_params, current_user, @users)
      redirect_to conversations_path
    else
      redirect_to conversations_path
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:title, { messages_attributes: [:id, :user_id, :content, :is_draft] })
  end

end

