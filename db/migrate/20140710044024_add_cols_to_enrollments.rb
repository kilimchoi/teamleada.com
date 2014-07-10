class AddColsToEnrollments < ActiveRecord::Migration
  def change
    add_column :enrollments, :notes, :text
    add_column :enrollments, :activities, :text
  end
end
