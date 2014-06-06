class MakeCompletedDefaultToFalse < ActiveRecord::Migration
  def change
    change_column :project_statuses, :completed, :boolean, default: false
  end
end
