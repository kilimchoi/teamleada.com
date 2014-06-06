class CreateProjectStatuses < ActiveRecord::Migration
  def change
    create_table :project_statuses do |t|
      t.references :user
      t.references :project
      t.boolean :completed

      t.timestamps
    end
  end
end
