class ChangeViewedUserIdColumnToString < ActiveRecord::Migration
  def change
    remove_column :page_views, :viewed_user_id
    add_column :page_views, :viewed_user_id, :string
  end
end
