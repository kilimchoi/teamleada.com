class CreateMetrics < ActiveRecord::Migration
  def change
    create_table :metrics do |t|
      t.string :model
      t.string :title
      t.string :method

      t.timestamps
    end

    remove_column :metrics, :id
    add_column :metrics, :uid, :integer, unique: true, null: false
    execute "ALTER TABLE metrics ADD PRIMARY KEY (uid);"
  end
end
