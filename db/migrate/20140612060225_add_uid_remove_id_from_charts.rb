class AddUidRemoveIdFromCharts < ActiveRecord::Migration
  def change
    remove_column :charts, :id
    add_column :charts, :uid, :integer, unique: true, null: false
    execute "ALTER TABLE charts ADD PRIMARY KEY (uid);"
  end
end
