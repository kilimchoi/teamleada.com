class CreatePageViews < ActiveRecord::Migration
  def change
    create_table :page_views do |t|
      t.references :user
      t.string :url
      t.string :controller
      t.string :action
      t.text :parameters
      t.text :properties

      t.timestamps
    end
  end
end
