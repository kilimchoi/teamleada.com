class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    alias_action :index, :show, to: :view

    can :index, Project

    if user.is_admin?
      can :manage, :all
    elsif user.is_company?
      can :show, Company
      can :show, Project do |project|
        user.company.projects.find_by(project: project)
      end
    elsif !user.new_record?
      can :show, User, id: user.id
      can :show, Project do |project|
        user.has_project_access? && (!project.paid || !user.has_not_paid_for_project?(project))
      end

      can :show, Lesson
      can :show, Step
    else
    end
  end

end
