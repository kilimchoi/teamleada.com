# == Schema Information
#
# Table name: project_scores
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  project_id :integer
#  score      :decimal(20, 5)
#  created_at :datetime
#  updated_at :datetime
#

class ProjectScore < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  default_scope { order('score DESC') }
end
