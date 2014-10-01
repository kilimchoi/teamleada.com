class CreateInterviewQuestions < ActiveRecord::Migration
  def change
    create_table :interview_questions do |t|
      t.string :title
      t.integer :difficulty_level
      t.text :question
      t.datetime :posted_at
      t.integer :industry
      t.integer :question_type

      t.timestamps
    end

    remove_column :interview_questions, :id
    add_column :interview_questions, :uid, :integer, unique: true, null: false
    execute "ALTER TABLE interview_questions ADD PRIMARY KEY (uid);"
  end
end
