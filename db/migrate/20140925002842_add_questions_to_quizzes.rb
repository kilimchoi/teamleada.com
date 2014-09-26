class AddQuestionsToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :question, :text
  end
end
