class Admin::Users::Projects::ProjectSubmissions::BaseController < Admin::Users::Projects::BaseController
  load_and_authorize_resource :project_submission
end
