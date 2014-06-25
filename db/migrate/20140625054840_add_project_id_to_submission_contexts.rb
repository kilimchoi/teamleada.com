class AddProjectIdToSubmissionContexts < ActiveRecord::Migration
  def change
    add_column :submission_contexts, :project_id, :integer
  end
end
