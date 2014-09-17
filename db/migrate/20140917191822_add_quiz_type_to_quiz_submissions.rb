class AddQuizTypeToQuizSubmissions < ActiveRecord::Migration
  def change
    add_column :quiz_submission_contents, :quiz_type, :string
  end
end
