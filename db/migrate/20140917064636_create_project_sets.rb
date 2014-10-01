class CreateProjectSets < ActiveRecord::Migration
  def change
    create_table :project_sets do |t|
      t.string :title
      t.text :description

      t.timestamps
    end

    remove_column :project_sets, :id
    add_column :project_sets, :uid, :integer, unique: true, null: false
    execute "ALTER TABLE project_sets ADD PRIMARY KEY (uid);"
  end
end
