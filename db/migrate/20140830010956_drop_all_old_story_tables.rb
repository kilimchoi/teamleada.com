class DropAllOldStoryTables < ActiveRecord::Migration
  def change
    drop_table :stories
    drop_table :user_completed_project_stories
  end
end
