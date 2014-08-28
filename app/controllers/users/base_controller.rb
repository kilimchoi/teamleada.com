class Users::BaseController < ApplicationController
  load_and_authorize_resource :user
end
