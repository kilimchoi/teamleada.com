class AddResumeFileToResumes < ActiveRecord::Migration
  def change
    add_column :resumes, :resume_file, :string
  end
end
