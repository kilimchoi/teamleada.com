class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    alias_action :index, :show, to: :view

    # Everyone
    can :index, Project
    can :show, Lesson
    can :show, Step

    if user.is_admin?
      # Only admins
      can :manage, :all
    elsif !user.new_record?
      # Anyone with an account (employee and student)
      can [:show, :edit, :update], User, id: user.id

      if user.is_company?
        # Only employees
        can :show, Company
        can [:show, :check_submission], Project do |project|
          user.company.projects.include? project
        end
      else
        # Only students
        can [:show, :check_submission], Project do |project|
          user.has_project_access? && (!project.paid || !user.has_not_paid_for_project?(project))
        end
      end
    end
  end

end
