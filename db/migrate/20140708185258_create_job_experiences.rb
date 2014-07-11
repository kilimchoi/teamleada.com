class CreateJobExperiences < ActiveRecord::Migration
  def change
    create_table :job_experiences do |t|
      t.references :user, index: true
      t.text :summary
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
