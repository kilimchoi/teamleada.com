class Users::Projects::BaseController < Users::BaseController
  load_and_authorize_resource :project
end
