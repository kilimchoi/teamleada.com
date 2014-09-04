class AddDataToStories < ActiveRecord::Migration
  def change
    add_column :stories, :data, :text
  end
end
