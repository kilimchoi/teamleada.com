class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.references :tag
      t.references :tagged, polymorphic: true

      t.timestamps
    end
  end
end
