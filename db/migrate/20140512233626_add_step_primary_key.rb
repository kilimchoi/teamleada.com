class AddStepPrimaryKey < ActiveRecord::Migration
  def change
    remove_column :steps, :id
    add_column :steps, :step_id, :integer
    add_column :steps, :uid, :string, unique: true, null: false
    execute "ALTER TABLE steps ADD PRIMARY KEY (uid);"
  end
end
