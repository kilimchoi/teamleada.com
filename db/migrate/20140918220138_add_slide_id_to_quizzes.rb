class AddSlideIdToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :slide_id, :string
  end
end
