class Admin::Users::Projects::CodeSubmissions::BaseController < Admin::Users::Projects::BaseController
  load_and_authorize_resource :code_submission
end
