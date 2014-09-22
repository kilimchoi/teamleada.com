class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    alias_action :index, :show, to: :view

    # Everyone
    can [:show, :project_info], Project
    can [:index, :show], Company

    can :show, Lesson do |lesson|
      (user.has_project_access? || lesson.project.grants_project_access) && (!lesson.project.deadline || (lesson.project.deadline && user.project_status_for_project(lesson.project).has_time_remaining?))
    end

    can :show, Step do |step|
      (user.has_project_access? || step.project.grants_project_access) && (!step.project.deadline || (step.project.deadline && user.project_status_for_project(step.project).has_time_remaining?))
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
        can [:check_submission, :complete, :submit_resource, :purchase, :resource, :feedback], Project do |project|
          project.enabled && (project.grants_project_access || (user.has_project_access? && (!project.paid || !user.has_not_paid_for_project?(project))))
        end

        can [:follow, :unfollow, :company_interest, :data_challenges_interest], Company do |company|
          company.verified
        end

        can [:check_answer], Quiz

        can [:show, :index], SubmissionContext
        can [:create], ImageSubmissionContent

#        can [:index, :create], Invite
      end
    end
  end

end
