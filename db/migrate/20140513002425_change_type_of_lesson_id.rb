class ChangeTypeOfLessonId < ActiveRecord::Migration
  def change
    change_column :steps, :lesson_id, :string
    change_column :slides, :parent_id, :string
  end
end
