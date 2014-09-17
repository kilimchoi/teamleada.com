# == Schema Information
#
# Table name: steps
#
#  lesson_id        :string(255)
#  content          :text
#  previous_step_id :string(255)
#  next_step_id     :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  title            :string(255)
#  url              :string(255)
#  step_id          :integer
#  uid              :string(255)      not null, primary key
#  points           :integer          default(1)
#

class Step < ActiveRecord::Base
  self.primary_key = "uid"

  include Rails.application.routes.url_helpers
  serialize :content, Array

  belongs_to :lesson, primary_key: :uid
  belongs_to :previous_step, class_name: "Step", primary_key: :uid
  has_many :next_steps, foreign_key: :previous_step_id, primary_key: :uid, class_name: "Step", dependent: :destroy
  has_many :step_requirements, foreign_key: :requiree_step_id
  has_many :step_dependents, foreign_key: :required_step_id, class_name: "StepRequirement"
  has_many :required_steps, through: :step_requirements
  has_many :dependent_steps, through: :step_dependents, source: :required_step

  has_many :slides, as: :parent, dependent: :destroy

  has_many :code_submissions, as: :parent

  before_create :set_url
  before_create :set_uid

  validates_presence_of :step_id
  validates_uniqueness_of :title, scope: [:lesson_id, :previous_step_id]

  extend FriendlyId
  friendly_id :url, use: :finders

  def set_uid
    self.uid = "p#{main_lesson.project.uid}_l#{main_lesson.lesson_id}_st#{step_id}"
  end

  def set_url
    self.url = title.urlify
  end

  def id
    step_id
  end

  def page_title
    "#{project.title} - #{main_lesson.title} - #{self.title}"
  end

  def total_points
    self.points + next_steps.collect{ |step| step.total_points }.sum
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

  def project
    main_lesson.project
  end

  def next_link
    current_uid = self.uid
    potential_step_uid = current_uid[0..-2] + (id + 1).to_s
    potential_next_step = Step.find_by_uid(potential_step_uid)

    if potential_next_step.nil?
      nil
    else
      project_lesson_step_path(main_lesson.project, main_lesson, potential_next_step)
    end
  end

  def back_link
    if previous_step.nil?
      project_lesson_path(lesson.project, lesson)
    else
      project_lesson_step_path(previous_step.main_lesson.project, previous_step.main_lesson, previous_step)
    end
  end

  def add_required_steps(steps)
    steps.each do |step|
      StepRequirement.create!(required_step: step, requiree_step: self)
    end
  end

end
