class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.references :user, index: true
      t.string :title
      t.text :description
      t.date :publication_date
      t.string :publisher

      t.timestamps
    end
  end
end
