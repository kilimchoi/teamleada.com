class AddProfileViewToPageViews < ActiveRecord::Migration
  def change
    add_column :page_views, :viewed_user_id, :integer
  end
end
