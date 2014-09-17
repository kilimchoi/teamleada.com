# == Schema Information
#
# Table name: lessons
#
#  title              :string(255)
#  content            :text
#  created_at         :datetime
#  updated_at         :datetime
#  previous_lesson_id :integer
#  next_lesson_id     :integer
#  project_id         :integer
#  url                :string(255)
#  lesson_id          :integer
#  uid                :string(255)      not null, primary key
#  points             :integer          default(1)
#

class Lesson < ActiveRecord::Base
  self.primary_key = "uid"

  include Rails.application.routes.url_helpers
  serialize :content, Array

  belongs_to :project
  has_many :steps, dependent: :destroy

  has_one :next_lesson
  has_one :previous_lesson

  has_many :slides, as: :parent, dependent: :destroy

  before_create :set_url
  before_create :set_uid

  validates_presence_of :lesson_id
  validates_uniqueness_of :title, scope: :project_id

  extend FriendlyId
  friendly_id :url, use: :finders

  def set_uid
    puts "************** Lessons: " + lesson_id.to_s
    self.uid = "p#{project_id}_l#{lesson_id}"
  end

  def set_url
    self.url = title.urlify
  end

  def id
    lesson_id
  end

  def page_title
    "#{project.title} - #{self.title}"
  end

  def next_link
    potential_lesson_uid = self.uid[0..-2] + (lesson_id + 1).to_s
    potential_next_lesson = Lesson.find_by_uid(potential_lesson_uid)
    if not potential_next_lesson.nil?
      project_lesson_path(project_id: project.url, id: potential_next_lesson.url)
    end
    #lesson_path(url: next_lesson.url)
  end

  def back_link
    project_path(url: project.url)
  end

  def first_lesson
    self == self.project.lessons.first
  end

end
