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
  belongs_to :content_object, foreign_key: :content_id, foreign_type: :content_type, polymorphic: true

  # submission context?

  delegate :content, to: :content_object, allow_nil: true

  class << self
    def exists_for_user_project_slide?(user, project, slide)
      ProjectSubmission.exists?(user: user, project: project, slide: slide)
    end

    def find_by_user_project_slide(user, project, slide)
      ProjectSubmission.find_by(user: user, project: project, slide: slide)
    end

    def create_with_user_project_slide_content_object(user, project, slide, content_object)
      ProjectSubmission.create(user: user, project: project, slide: slide, content_object: content_object)
    end
  end
end
