class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    alias_action :index, :show, to: :view

    # Everyone
    can [:index, :project_info], Project
    # Re-enable below when companies are viewable by everyone
#    can [:index, :show], Company


    can :show, Lesson do |lesson|
      !lesson.project.deadline || (lesson.project.deadline && user.project_status_for_project(lesson.project).has_time_remaining?)
    end

    can :show, Step do |step|
      !step.project.deadline || (step.project.deadline && user.project_status_for_project(step.project).has_time_remaining?)
    end

    if user.is_admin?
      # Only admins
      can :manage, :all
    elsif !user.new_record?
      # Anyone with an account (employee and student)
      can [:show, :edit, :update, :profile, :edit_profile], User, id: user.id
      can [:index], Story
      can [:show, :index, :create, :new, :autocomplete_user_name], Conversation if Feature.enabled?("messaging")
      can [:show, :index, :create, :new], Message if Feature.enabled?("messaging")

      if user.is_company?
        # Only companies
        can [:view, :show_project, :favorite, :unfavorite], User

        can :show, Company
        can [:show, :check_submission, :complete, :submit_resource, :purchase, :resource], Project do |project|
          user.company.projects.include? project
        end
      else
        # Only students
        can [:show, :check_submission, :complete, :submit_resource, :purchase, :resource, :feedback], Project do |project|
          project.enabled && (project.grants_project_access || (user.has_project_access? && (!project.paid || !user.has_not_paid_for_project?(project))))
        end

#        can [:index, :create], Invite
      end
    end
  end

end
