class Company::PagesController < Company::BaseController
  layout "company"

  def dashboard
    @company = current_user.company
    @stories = @company.stories
  end

end
