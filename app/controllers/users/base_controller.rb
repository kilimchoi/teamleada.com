class Users::BaseController < ApplicationController
  authorize_resource class: true
end
