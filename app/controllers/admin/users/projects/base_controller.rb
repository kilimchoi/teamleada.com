class Admin::Users::Projects::BaseController < Admin::Users::BaseController
  load_and_authorize_resource :project
end
