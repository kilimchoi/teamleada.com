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
      can :show, Project do |project|
        !project.paid || !project.transactions.find_by(user: user).nil?
      end
      can :index, Project

      can :show, Lesson
      can :show, Step
    end
  end

end
