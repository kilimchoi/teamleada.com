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
  belongs_to :project
  belongs_to :user

  validates_uniqueness_of :user_id, scope: :project_id

  after_create :create_user_project_interest_story

  def create_user_project_interest_story
    UserProjectInterestStory.create_with_user_and_project(user, project)
  end

end
