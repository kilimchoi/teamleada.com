class InvitessController < ApplicationController
  load_and_authorize_resource

  def index
    @invite = current_user.invites.build
  end

end
