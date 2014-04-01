class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :title
      t.text :content
      t.references :parent

      t.timestamps
    end
  end
end
