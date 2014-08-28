# == Schema Information
#
# Table name: project_submissions
#
#  id         :integer          not null, primary key
#  project_id :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class ProjectSubmission < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
end
