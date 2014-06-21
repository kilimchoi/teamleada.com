class RemovePageViewTable < ActiveRecord::Migration
  def self.up
    drop_table :page_views
  end

  def self.down
  end
end
