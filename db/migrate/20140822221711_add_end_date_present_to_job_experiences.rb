class AddEndDatePresentToJobExperiences < ActiveRecord::Migration
  def change
    add_column :job_experiences, :end_date_present, :boolean
  end
end
