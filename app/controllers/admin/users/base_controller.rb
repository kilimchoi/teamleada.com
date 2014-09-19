class Admin::Users::BaseController < Admin::BaseController
  load_and_authorize_resource :user
end
