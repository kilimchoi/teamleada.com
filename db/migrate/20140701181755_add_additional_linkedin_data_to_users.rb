class AddAdditionalLinkedinDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :date_of_birth, :datetime
    add_column :users, :school_name, :string
    add_column :users, :grad_year, :integer
    add_column :users, :interests, :text
    add_column :users, :job_bookmarks_count, :integer
    add_column :users, :job_total_count, :integer
    add_column :users, :publications_count, :integer
    add_column :users, :recom_count, :integer
    add_column :users, :skills_count, :integer
  end
end
