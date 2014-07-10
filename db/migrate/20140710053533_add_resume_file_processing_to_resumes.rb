class AddResumeFileProcessingToResumes < ActiveRecord::Migration
  def change
    add_column :resumes, :resume_file_processing, :boolean, default: false
  end
end
