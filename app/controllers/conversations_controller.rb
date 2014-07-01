class ConversationsController < ApplicationController
  load_and_authorize_resource

  def index
    @conversations = current_user.conversations
  end

  def show
  end

end
