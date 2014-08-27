class AddProjRefToQuizzes < ActiveRecord::Migration
  def change
    add_reference :quizzes, :project
  end
end
