class AddPreviousAndNextLessontoLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :previous_lesson_id, :integer
    add_column :lessons, :next_lesson_id, :integer
  end
end
