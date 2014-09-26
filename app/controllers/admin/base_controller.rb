class Admin::BaseController < ApplicationController
  authorize_resource class: false
  layout "admin"
end
