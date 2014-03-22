class Step < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  serialize :content, Array

  belongs_to :lesson
  belongs_to :previous_step, class_name: "Step"
  has_many :next_steps, foreign_key: :previous_step_id, class_name: "Step"
  has_many :required_steps, foreign_key: :required_id, class_name: 'RequiredStep'
  has_many :dependent_steps, foreign_key: :requiree_id, class_name: 'RequiredStep'

  before_create :set_url
  validates_uniqueness_of :title, scope: [:lesson_id, :previous_step_id]

  def set_url
    self.url = title.downcase.gsub(/[^a-z\s]/, '').parameterize
  end

  def main_lesson
    unless lesson.nil?
      lesson
    else
      current_step = self
      while current_step.lesson.nil?
        current_step = current_step.previous_step
      end
      current_step.lesson
    end
  end

  def back_link
    if previous_step.nil?
      project_lesson_path(project_url: lesson.project.url, url: lesson.url)
    else
      project_lesson_step_path(project_url: previous_step.main_lesson.project.url, lesson_url: previous_step.main_lesson.url, url: previous_step.url)
    end
  end

end
