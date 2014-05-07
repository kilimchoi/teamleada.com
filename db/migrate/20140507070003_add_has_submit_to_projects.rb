class AddHasSubmitToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :has_submit, :boolean, default: :false
  end
end
