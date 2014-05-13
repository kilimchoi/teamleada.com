class SurveysController < ApplicationController
	def show
		@survey = params[:name]
	end
end
