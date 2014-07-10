class AddResumeFileTmpToResumes < ActiveRecord::Migration
  def change
    add_column :resumes, :resume_file_tmp, :string
  end
end
