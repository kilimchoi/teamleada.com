class Admin::PagesController < Admin::BaseController
  include ChartsHelper

  def dashboard
    @users_chart = users_chart(30.days.ago)

    @new_users = User.last(5).reverse
    @new_resumes = Resume.last(5).reverse
    @new_profile_photos = ProfilePhoto.last(5).reverse
    @new_code_submissions = CodeSubmission.last(5).reverse

    @all_time_impressions = Impression.all
    @monthly_impressions = @all_time_impressions.where("created_at >= ?", 30.days.ago.to_date)
    @weekly_impressions = @monthly_impressions.where("created_at >= ?", 7.days.ago.to_date)
    @daily_impressions = @weekly_impressions.where("created_at >= ?", Date.today.to_date)

    @daily_project_impressions = @daily_impressions.where(controller_name: "projects")
    @daily_new_users = User.where("created_at >= ?", Date.today.to_date)
    @daily_code_submissions = CodeSubmission.where("created_at >= ?", Date.today.to_date)
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
    @page_views = Impression.where("created_at > ?", 1.day.ago).group(:url).count
  end

end
