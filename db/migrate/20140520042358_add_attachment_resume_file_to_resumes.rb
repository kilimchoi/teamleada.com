class AddAttachmentResumeFileToResumes < ActiveRecord::Migration
  def self.up
    change_table :resumes do |t|
      t.attachment :resume_file
    end
  end

  def self.down
    drop_attached_file :resumes, :resume_file
  end
end
