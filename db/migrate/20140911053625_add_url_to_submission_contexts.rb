class AddUrlToSubmissionContexts < ActiveRecord::Migration
  def change
    add_column :submission_contexts, :url, :string
  end
end
