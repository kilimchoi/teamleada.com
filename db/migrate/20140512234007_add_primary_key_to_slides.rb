class AddPrimaryKeyToSlides < ActiveRecord::Migration
  def change
    remove_column :slides, :id
    add_column :slides, :slide_id, :integer
    add_column :slides, :uid, :string, unique: true, null: false
    execute "ALTER TABLE slides ADD PRIMARY KEY (uid);"
  end
end
