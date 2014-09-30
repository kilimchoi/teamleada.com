class Admin::PagesController < Admin::BaseController
  include ChartsHelper

  before_filter :check_timeframe, only: [:page_views_timeframe, :page_views_projects]

  def dashboard
    @users_chart = users_chart(30.days.ago)
    @growth_chart = growth_chart(30.days.ago)

    @new_users = User.last(5).reverse
    @new_resumes = Resume.last(5).reverse
    @new_profile_photos = ProfilePhoto.last(5).reverse
    @new_project_submissions = ProjectSubmission.last(5).reverse

    @weekly_impressions = Impression.where("created_at >= ?", 7.days.ago.to_date)
    @daily_impressions = @weekly_impressions.where("created_at >= ?", Date.today.to_date)

    @daily_project_impressions = @daily_impressions.filter_category("projects")
    @daily_company_impressions = @daily_impressions.filter_category("companies")
    @daily_new_users = User.where("created_at >= ?", Date.today.to_date)
    @daily_project_submissions = ProjectSubmission.non_admin.where("created_at >= ?", Date.today.to_date)
    @daily_interview_question_submissions = InterviewQuestionSubmission.non_admin.where("created_at >= ?", Date.today.to_date)
  end

  def active_users_charts
    @one_day_7 = active_users_chart(7.days, 30.days.ago)
    @one_day_28 = active_users_chart(28.days, 120.days.ago)
  end

  def activity
    @admin_subscriber = Subscriber.find_by(name: "admin")
    @story_notifications = @admin_subscriber.story_notifications.paginate(page: params[:page])
  end

  def metrics
    @days = Day.all.paginate(page: params[:page])
  end

  def realtime_charts
    @users_chart = users_chart(30.days.ago)
    @detailed_users_chart = detailed_users_chart(30.days.ago)
    @interest_chart = interest_chart(30.days.ago)
    @resumes_chart = resumes_chart(30.days.ago)
    @employer_applications_chart = employer_applications_chart(30.days.ago)
    @code_submission_chart = code_submission_chart(30.days.ago)
  end

  def company_dashboards
  end

  def page_view_charts
    @seven_day_engagement = page_views_chart(7.days.ago)
    @one_day_engagement = one_day_chart
    @page_views = Impression.non_admin.where("created_at > ?", 1.day.ago).group(:url).count
  end

  def growth_charts
  end

  def project_submission_charts
    @project_submission_chart = project_submission_chart(30.days.ago)
  end

  # TODO(mark): These should be moved into a separate controller
  def page_views_dashboard
    @timeframes = Impression::TIMEFRAMES
  end

  def page_views_timeframe
    @timeframe = params[:timeframe]if params[:timeframe].present?
    @page_view_categories = Impression::CATEGORIES
    @title = "#{@timeframe.humanize} Page Views"
  end

  def page_views_category
    @timeframe = params[:timeframe] if params[:timeframe].present?
    @category = params[:category] if params[:category].present?
    @title = "#{@timeframe.humanize} Page Views - #{@category.humanize}"

    @page_views = Impression.filter_timeframe(@timeframe, Date.today).filter_category(@category)
    @page_views = @page_views.paginate(page: params[:page])
  end

  private

  def check_timeframe
    # TODO(mark): Figure out why this constraint object doesn't work on routes
    redirect_to root_path and return unless ImpressionTimeframeConstraint.new.matches?(params[:timeframe])
  end

end
