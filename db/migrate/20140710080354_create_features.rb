class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.boolean :enabled?

      t.timestamps
    end
  end
end
