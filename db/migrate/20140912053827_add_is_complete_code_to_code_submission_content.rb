class AddIsCompleteCodeToCodeSubmissionContent < ActiveRecord::Migration
  def change
    add_column :code_submission_contents, :is_complete_code, :boolean, default: false
  end
end
