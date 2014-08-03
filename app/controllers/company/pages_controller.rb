class Company::PagesController < Company::BaseController

  def dashboard
    @company = current_user.company
  end

end
