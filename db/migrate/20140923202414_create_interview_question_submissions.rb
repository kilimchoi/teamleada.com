class CreateInterviewQuestionSubmissions < ActiveRecord::Migration
  def change
    create_table :interview_question_submissions do |t|
      t.references :interview_question
      t.references :user
      t.text :content

      t.timestamps
    end
  end
end
