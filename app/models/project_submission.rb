# == Schema Information
#
# Table name: project_submissions
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  project_id   :integer
#  slide_id     :string(255)
#  content_id   :integer
#  content_type :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class ProjectSubmission < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :slide
  belongs_to :content, polymorphic: true

  # submission context?

  class << self
    def exists_for_user_project_slide?(user, project, slide)
      ProjectSubmission.exists?(user: user, project: project, slide: slide)
    end

    def create_with_user_project_slide_content(user, project, slide, content)
      ProjectSubmission.create(user: user, project: project, slide: slide, content: content)
    end
  end
end
