class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.string :date

      t.timestamps
    end

    remove_column :days, :id
    add_column :days, :uid, :integer, unique: true, null: false
    execute "ALTER TABLE days ADD PRIMARY KEY (uid);"
  end
end
