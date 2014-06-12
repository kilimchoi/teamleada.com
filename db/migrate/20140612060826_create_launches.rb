class CreateLaunches < ActiveRecord::Migration
  def change
    create_table :launches do |t|
      t.references :day
      t.string :title

      t.timestamps
    end

    remove_column :launches, :id
    add_column :launches, :uid, :integer, unique: true, null: false
    execute "ALTER TABLE launches ADD PRIMARY KEY (uid);"
  end
end
