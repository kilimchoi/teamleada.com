class CreateJobRecommendations < ActiveRecord::Migration
  def change
    create_table :job_recommendations do |t|
      t.string :reviewer_first_name
      t.string :reviewer_last_name
      t.string :reviewer_linkedin_id
      t.references :reviewee, references: :users
      t.string :type
      t.text :body

      t.timestamps
    end
  end
end
