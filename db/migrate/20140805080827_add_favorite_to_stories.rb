class AddFavoriteToStories < ActiveRecord::Migration
  def change
    add_column :stories, :favorite, :boolean, default: true
  end
end
