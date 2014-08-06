class AddTypeToStories < ActiveRecord::Migration
  def change
    add_column :stories, :type, :string
  end
end
