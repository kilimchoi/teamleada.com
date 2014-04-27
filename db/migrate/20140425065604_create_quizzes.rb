class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :quiz_id
      t.string :answer

      t.timestamps
    end
  end
end
