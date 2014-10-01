class RemoveUserIdFromFreeResponseSubmissionContents < ActiveRecord::Migration
  def change
    remove_column :free_response_submission_contents, :user_id
  end
end
