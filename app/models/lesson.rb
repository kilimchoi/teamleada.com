class Lesson < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  belongs_to :project
  has_many :steps

  has_one :next_lesson
  has_one :previous_lesson

  def paragraphs
    content.split("\n")
  end

  def back_link
    project_path(url: project.url)
  end

end
