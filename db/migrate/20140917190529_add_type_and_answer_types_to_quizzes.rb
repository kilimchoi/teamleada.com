class AddTypeAndAnswerTypesToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :type, :string
    add_column :quizzes, :multiple_choices, :text
    add_column :quizzes, :lower_bound, :decimal, precision: 10, scale: 5
    add_column :quizzes, :upper_bound, :decimal, precision: 10, scale: 5
  end
end
