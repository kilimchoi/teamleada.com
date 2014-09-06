class SplitSubmitInProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :has_submit
    add_column :projects, :has_content_subtmit, :boolean
    add_column :projects, :has_written_submit, :boolean
  end
end
