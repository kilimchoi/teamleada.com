class ChangeObjectToActionObjectForStories < ActiveRecord::Migration
  def change
    change_table :stories do |t|
      t.references :action_object, polymorphic: true
    end

    Story.all.each do |story|
      story.action_object = story.try(:object)
      story.save
    end

    change_table :stories do |t|
      t.remove_references :object, polymorphic: true
    end
  end
end
