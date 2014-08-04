class AddColsToEducationTables < ActiveRecord::Migration
  def change
    add_column :enrollments, :notes, :text
    add_column :enrollments, :activities, :text
    add_column :universities, :linkedin_school_id, :string
  end
end
