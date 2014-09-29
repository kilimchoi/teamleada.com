class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :taggings_count, default: 0, null: false

      t.timestamps
    end
  end
end
