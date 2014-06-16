# == Schema Information
#
# Table name: code_submissions
#
#  id          :integer          not null, primary key
#  content     :text
#  user_id     :integer
#  project_id  :integer
#  parent_id   :string(255)
#  parent_type :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  slide_index :integer
#

class CodeSubmission < ActiveRecord::Base
  belongs_to :parent, polymorphic: true, primary_key: :uid
  belongs_to :user
  belongs_to :project

  default_scope { order(:created_at) }

  def slide
    parent.slides[slide_index]
  end

  def submission_context
    # TODO: Until we have submssion contexts, show the slide title?
    slide.submission_context || SubmissionContext.new(
      title: "Submission title",
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    )
  end

  def pretty_submitted_date
    created_at.strftime("%B %d, %Y at %l:%M %p")
  end

end
