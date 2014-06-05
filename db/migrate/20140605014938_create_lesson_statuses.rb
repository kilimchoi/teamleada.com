class CreateLessonStatuses < ActiveRecord::Migration
  def change
    create_table :lesson_statuses do |t|
      t.string :lesson_id
      t.references :user
      t.references :project
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
