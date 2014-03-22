class ChangeLessonContentToArray < ActiveRecord::Migration
  def change
    change_column :lessons, :content, :text
    change_column :steps, :content, :text
  end
end
