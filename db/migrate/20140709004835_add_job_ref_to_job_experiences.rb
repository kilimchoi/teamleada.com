class AddJobRefToJobExperiences < ActiveRecord::Migration
  def change
    add_reference :job_experiences, :job, index: true
  end
end
