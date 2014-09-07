class Companies::BaseController < ApplicationController
  load_and_authorize_resource :company
end
