class Admin::PagesController < Admin::BaseController
  include ChartsHelper

  def dashboard
    @users_chart = users_chart(30.days.ago)
    @interest_chart = interest_chart(30.days.ago)
  end

end
