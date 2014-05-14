class ProjectsController < ApplicationController
  load_and_authorize_resource except: [:show_interest]

  def show
  end

  def index
    if signed_in? && current_user.has_project_access? && !current_user.is_admin?
      @projects = @projects.enabled
    end
    if signed_in? && current_user.is_company?
      @projects = current_user.company.projects
    end
    @interested_user = InterestedUser.new
    @large_header = true
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
        flash[:warning] = "Your score of #{@submission.score} from last time was the same or better. Be sure to submit again to see if you improved!"
      end
      redirect_to project_path(url: @project.url)
    else
      flash[:danger] = "There was an error in your submission, please try again."
      redirect_to :back
    end
  end

  def show_interest
    redirect_to new_user_registration_path unless signed_in?
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

end
