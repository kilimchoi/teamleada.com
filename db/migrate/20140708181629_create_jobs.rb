class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.references :user, index: true
      t.references :company, index: true
      t.date :start_date
      t.date :end_date
      t.text :description

      t.timestamps
    end
  end
end
