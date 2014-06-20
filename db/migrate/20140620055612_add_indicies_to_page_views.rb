class AddIndiciesToPageViews < ActiveRecord::Migration
  def change
    add_index :page_views, :url
    add_index :page_views, :user_id
    add_index :page_views, :viewed_user_id
    add_index :page_views, [:user_id, :viewed_user_id]
  end
end
