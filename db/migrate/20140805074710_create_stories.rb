class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.references :interactor
      t.references :interactee
      t.references :company
      t.text :text

      t.timestamps
    end
  end
end
