class AddRequiredToSubmissionContexts < ActiveRecord::Migration
  def change
    add_column :submission_contexts, :required, :boolean, default: true
  end
end
