class AddTitleToSubmissionContexts < ActiveRecord::Migration
  def change
    add_column :submission_contexts, :title, :string
  end
end
