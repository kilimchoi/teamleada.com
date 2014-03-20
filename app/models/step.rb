class Step < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  belongs_to :lesson
  has_many :next_steps, foreign_key: :previous_step_id, class_name: "Step"

  belongs_to :previous_step, class_name: "Step"

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
      project_lesson_path(project_url: lesson.project.url, id: lesson.id)
    else
      project_lesson_step_path(project_url: previous_step.main_lesson.project.url, lesson_id: previous_step.main_lesson.id, id: previous_step.id)
    end
  end

end
