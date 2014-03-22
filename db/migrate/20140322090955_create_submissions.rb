class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.references :user
      t.references :project
      t.decimal :score, precision: 8, scale: 2

      t.timestamps
    end
  end
end
