class RenameEducationToEnrollment < ActiveRecord::Migration
  def change
      rename_table :educations, :enrollments
  end
end
