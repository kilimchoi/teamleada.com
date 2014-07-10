class RemoveLinkedinColsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :school_name
    remove_column :users, :grad_year
    remove_column :users, :job_total_count
    remove_column :users, :publications_count
    remove_column :users, :recom_count
    remove_column :users, :skills_count
  end
end
