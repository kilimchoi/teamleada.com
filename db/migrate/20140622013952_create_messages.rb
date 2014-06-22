class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user
      t.references :rich_content, polymorphic: true
      t.text :content
      t.boolean :is_draft

      t.timestamps
    end
  end
end
