class RecreateProjectSubmissions < ActiveRecord::Migration
  def change
    create_table :project_submissions do |t|
      t.references :user, index: true
      t.references :project, index: true
      t.references :slide, index: true
      t.references :content, polymorphic: true

      t.timestamps
    end
  end

end
