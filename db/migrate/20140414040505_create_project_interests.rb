class CreateProjectInterests < ActiveRecord::Migration
  def change
    create_table :project_interests do |t|
      t.references :project
      t.references :user

      t.timestamps
    end
  end
end
