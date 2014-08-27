class ChangeQuizSubmissionQuizIdToString < ActiveRecord::Migration
  def change
    change_column :quiz_submissions, :quiz_id, :string
  end
end
