class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    alias_action :index, :show, to: :view

    if user.is_admin?
      can :manage, :all
    elsif user.is_company?
      can :dashboard
    elsif !user.new_record?
      can :show, User, id: user.id
    end
  end
end
