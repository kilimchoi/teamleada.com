class CreateUserCompletedProjectStories < ActiveRecord::Migration
  def change
    create_table :user_completed_project_stories do |t|
      t.datetime :completed_at
      t.references :project

      t.timestamps
    end
  end
end
