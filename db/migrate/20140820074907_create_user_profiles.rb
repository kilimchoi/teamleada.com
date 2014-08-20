class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.references :user

      t.boolean :looking_for_opportunities, default: true
      t.string :location
      t.text :bio
      t.string :phone
      t.string :headline
      t.string :industry
      t.date :date_of_birth
      t.text :interests
      t.integer :job_bookmarks_count
      t.string :country_code

      t.timestamps
    end
  end
end
