# == Schema Information
#
# Table name: project_interests
#
#  id         :integer          not null, primary key
#  project_id :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class ProjectInterest < ActiveRecord::Base
  belongs_to :project, primary_key: :uid
  belongs_to :user

  validates_uniqueness_of :user_id, scope: :project_id
end
