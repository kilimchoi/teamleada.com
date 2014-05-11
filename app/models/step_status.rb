# == Schema Information
#
# Table name: step_statuses
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  step_id    :integer
#  completed  :boolean
#  created_at :datetime
#  updated_at :datetime
#  project_id :integer
#

class StepStatus < ActiveRecord::Base
  belongs_to :user
  belongs_to :step
  belongs_to :project
end
