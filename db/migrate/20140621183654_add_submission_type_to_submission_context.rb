class AddSubmissionTypeToSubmissionContext < ActiveRecord::Migration
  def change
    add_column :submission_contexts, :submission_type, :string
  end
end
