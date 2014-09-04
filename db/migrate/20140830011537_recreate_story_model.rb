class RecreateStoryModel < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.references :subject, polymorphic: true
      t.references :object, polymorphic: true
      t.string :type

      t.timestamps
    end
  end
end
