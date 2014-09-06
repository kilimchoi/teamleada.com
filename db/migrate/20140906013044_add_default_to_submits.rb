class AddDefaultToSubmits < ActiveRecord::Migration
  def change 
    rename_column :projects, :has_content_subtmit, :has_content_submit
    change_column :projects, :has_content_submit, :boolean, :default => false
    change_column :projects, :has_written_submit, :boolean, :default => false
  end
end
