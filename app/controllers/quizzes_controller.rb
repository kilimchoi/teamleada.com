class QuizzesController < ApplicationController
	def check_answer
		@result = Quiz.find_by_quiz_id(params[:quiz_id])
    if @result == params[:user_input] #if answer is same as what user inputed @TODO clean user input.
      render :text => "correct"
    else
      render :text => @result
    end
	end

	end
end
