class CreateUniversities < ActiveRecord::Migration
  def change
    create_table :universities do |t|
      t.string :name
      t.string :location
      t.boolean :verified?

      t.timestamps
    end
  end
end
