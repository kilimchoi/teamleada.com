class CreateProjectSubmissions < ActiveRecord::Migration
  def change
    create_table :project_submissions do |t|
      t.references :project
      t.references :user

      t.timestamps
    end
  end
end
