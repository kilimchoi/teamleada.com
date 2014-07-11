class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.references :user, index: true
      t.references :university, index: true
      t.string :field_of_study
      t.string :degree
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
