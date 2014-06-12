class Admin::PagesController < Admin::BaseController
  include ChartsHelper

  def dashboard
    @users_chart = users_chart(30.days.ago)
    @new_users = User.last(5).reverse
    @new_resumes = Resume.last(5).reverse
  end

  def realtime_charts
    @users_chart = users_chart(30.days.ago)
    @detailed_users_chart = detailed_users_chart(30.days.ago)
    @interest_chart = interest_chart(30.days.ago)
    @resumes_chart = resumes_chart(30.days.ago)
    @employer_applications_chart = employer_applications_chart(30.days.ago)
    @code_submission_chart = code_submission_chart(30.days.ago)
  end

end
