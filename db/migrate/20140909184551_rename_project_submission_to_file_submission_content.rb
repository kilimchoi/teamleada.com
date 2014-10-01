class RenameProjectSubmissionToFileSubmissionContent < ActiveRecord::Migration
  def change
    rename_table :project_submissions, :file_submission_contents
    add_column :file_submission_contents, :type, :string

    # All of the project submissions so far are images
    FileSubmissionContent.all.each do |content|
      content.type = "ImageSubmissionContent"
      content.save
    end
  end
end
