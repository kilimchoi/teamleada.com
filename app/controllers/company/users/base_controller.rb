class Company::Users::BaseController < Company::BaseController
  load_and_authorize_resource :user
end
