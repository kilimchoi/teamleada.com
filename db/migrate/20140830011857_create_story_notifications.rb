class CreateStoryNotifications < ActiveRecord::Migration
  def change
    create_table :story_notifications do |t|
      t.references :story
      t.references :notified, polymorphic: true

      t.timestamps
    end
  end
end
