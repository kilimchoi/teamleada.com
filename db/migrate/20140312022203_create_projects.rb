class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title, unique: true
      t.text :description

      t.timestamps
    end
  end
end
