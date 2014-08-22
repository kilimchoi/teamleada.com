class EditAboutForm < Form

  delegate :bio, :date_of_birth, :location, :looking_for_opportunities, to: :user_profile

  def initialize(user)
    @user = user
  end

  def user_profile
    @user_profile ||= @user.profile
  end

  def set_attributes(params)
    user_profile.bio                       = params[:bio] if params[:bio].present?
    user_profile.date_of_birth             = params[:date_of_birth] if params[:date_of_birth].present?
    user_profile.location                  = params[:location] if params[:location].present?
    user_profile.looking_for_opportunities = params[:looking_for_opportunities] if params[:looking_for_opportunities].present?
  end

  def save
    user_profile.save
  end

end

