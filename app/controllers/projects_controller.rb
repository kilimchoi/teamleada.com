class ProjectsController < ApplicationController
  include ApplicationHelper
  load_and_authorize_resource except: [:show_interest, :project_info]
  load_resource only: [:show_interest, :project_info]

  before_filter :set_slide, only: [:resource, :submit_resource]

  def show
    @project_status = ProjectStatus.find_by(project: @project, user: current_user)
  end

  def project_info
    respond_to do |format|
      format.js {
        render partial: "projects/project_info"
      }
      format.html {
        redirect_to project_path(@project)
      }
    end
  end

  def index
    @project_data = get_yaml_data_file("projects.yml")

    @projects = @projects.enabled
    @projects = @projects.displayable
    @featured_projects = @projects.featured

    # Don't show featured projects twice
    projects = @projects.enabled.not_featured

    @data_lessons    = projects.where(category: Project::LESSON).reverse
    @data_challenges = projects.where(category: Project::CHALLENGE).reverse
    @coming_soon     = projects.where(category: Project::COMING_SOON).reverse

    @interested_user = InterestedUser.new
  end

  def check_submission
    if params[:file].nil?
      flash[:danger] = "You must provide a submission file."
      redirect_to :back
      return
    elsif File.extname(params[:file].original_filename) != ".csv"
      flash[:danger] = "Your file submission must be a CSV."
      redirect_to :back
      return
    end
    score = @project.check_submission(params[:file])
    @submission = Submission.find_by(project: @project, user: current_user)
    score_improved = @project.score_improved? score, @submission
    old_rank = -1
    new_rank = -1
    new_submission = false
    if @submission.nil?
      @submission = Submission.new(project: @project, user: current_user, score: score)
      new_submission = true
    elsif score_improved
      old_rank = @project.submission_rank(@submission)
      @submission.update(score: score)
      new_rank = @project.submission_rank(@submission)
    end

    if @submission.save
      if new_submission
        flash[:info] = "Your score is: #{score}. Check how you did on the LEADAboard!"
      elsif score_improved
        flash[:info] = "Your score of #{score} improved your position on the leaderboard! Your old rank was #{old_rank} and now your rank is #{new_rank}!"
      else
        flash[:warning] = "You just scored #{score} which is lower than your highest score of #{@submission.score}. Be sure to submit again to see if you improved!"
      end
      redirect_to project_path(url: @project.url)
    else
      flash[:danger] = "There was an error in your submission, please try again."
      redirect_to :back
    end
  end

  def show_interest
    redirect_to new_user_registration_path and return unless signed_in?
    if ProjectInterest.exists?(user: current_user, project: @project)
      flash[:info] = "Thanks for your enthusiasm, but you've already shown interest in this project!"
      redirect_to :back
      return
    end
    project_interest = ProjectInterest.new(user: current_user, project: @project)
    if project_interest.save
      flash[:info] = "Thanks for showing interest in #{@project.title}."
      redirect_to projects_path
    else
      flash[:danger] = "There was an error saving your interest, please try again."
      redirect_to :back
    end
  end

  def complete
    @project_status = ProjectStatus.find_by(user: current_user, project: @project)
    if current_user.completed_points(@project) >= @project.total_points
      @project_status.mark_complete
      if @project.is_onboarding
        # TODO(mark): I want this message to be more than just a toast message. I want it to show up prominently on the user profile.
        flash[:info] = "Congratulations! You have submitted your first Leada data challenge! Check out the featured company hosted challenges on the right hand sidebar below!"
        redirect_to user_path(current_user)
      else
        flash[:info] = "Congratulations! You have completed the #{@project.title} project! Check back on the company page to see more projects!"
        redirect_to @project
      end
    else
      flash[:error] = "You have not completed all of the lessons, steps, and code submissions for this project!"
      redirect_to current_user.next_lesson_or_step_for_project_path(@project)
    end
  end

  def submit_resource
    @submission = @slide.submission_context.create_or_update_content_with_user_project_slide_content(current_user, @project, @slide, params[:content])
    if @submission.save
      respond_to do |format|
        format.json { render json: {}, status: :ok }
      end
    else
      respond_to do |format|
        format.json { render json: {}, status: 422 }
      end
    end
  end

  def resource
    @submission = ProjectSubmission.find_by_user_project_slide(current_user, @project, @slide)
    if @submission
      respond_to do |format|
        format.json { render json: {content: @submission.content}, status: :ok }
      end
    else
      respond_to do |format|
        format.json { render json: {content: ""}, status: :ok}
      end
    end
  end

  private

  def set_slide
    @slide = Slide.find_by(
      parent_type: params[:parent_type],
      parent_id: params[:parent_id],
      slide_id: params[:slide_id],
    )
  end

end
