class Admin::Users::ProjectsController < Admin::Users::BaseController
  load_and_authorize_resource :project
end
