class CreateCodeSubmissions < ActiveRecord::Migration
  def change
    create_table :code_submissions do |t|
      t.text :content
      t.references :user
      t.references :project
      t.string :parent_id
      t.string :parent_type

      t.timestamps
    end
  end
end
