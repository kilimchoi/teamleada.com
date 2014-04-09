class Step < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  serialize :content, Array

  belongs_to :lesson
  belongs_to :previous_step, class_name: "Step"
  has_many :next_steps, foreign_key: :previous_step_id, class_name: "Step"
  has_many :step_requirements, foreign_key: :requiree_step_id
  has_many :step_dependents, foreign_key: :required_step_id, class_name: "StepRequirement"
  has_many :required_steps, through: :step_requirements
  has_many :dependent_steps, through: :step_dependents, source: :required_step

  has_many :slides, as: :parent

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

  def add_required_steps(steps)
    steps.each do |step|
      StepRequirement.create!(required_step: step, requiree_step: self)
    end
  end

end
