class Users::Projects::BaseController < Users::BaseController
  load_and_authorize_resource :project
  layout "users/projects"
end
