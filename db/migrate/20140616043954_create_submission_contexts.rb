class CreateSubmissionContexts < ActiveRecord::Migration
  def change
    create_table :submission_contexts do |t|
      t.text :description
      t.integer :submission_context_id
      t.string :slide_id

      t.timestamps
    end

    remove_column :submission_contexts, :id
    add_column :submission_contexts, :uid, :string, unique: true, null: false
    execute "ALTER TABLE submission_contexts ADD PRIMARY KEY (uid);"
  end
end
