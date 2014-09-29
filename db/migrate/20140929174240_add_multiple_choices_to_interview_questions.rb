class AddMultipleChoicesToInterviewQuestions < ActiveRecord::Migration
  def change
    add_column :interview_questions, :multiple_choices, :text
  end
end
