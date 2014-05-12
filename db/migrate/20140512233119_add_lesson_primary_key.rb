class AddLessonPrimaryKey < ActiveRecord::Migration
  def change
    remove_column :lessons, :id
    add_column :lessons, :lesson_id, :integer
    add_column :lessons, :uid, :string, unique: true, null: false
    execute "ALTER TABLE lessons ADD PRIMARY KEY (uid);"
  end
end
