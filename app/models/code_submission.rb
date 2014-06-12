class CodeSubmission < ActiveRecord::Base
  belongs_to :parent, polymorphic: true, primary_key: :uid
  belongs_to :user
  belongs_to :project

  default_scope { order(:created_at) }

  def slide
    parent.slides[slide_index]
  end

  def pretty_submitted_date
    created_at.strftime("%B %d, %Y at %l:%M %p")
  end

end
