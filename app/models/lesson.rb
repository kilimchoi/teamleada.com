# == Schema Information
#
# Table name: lessons
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  content            :text
#  created_at         :datetime
#  updated_at         :datetime
#  previous_lesson_id :integer
#  next_lesson_id     :integer
#  project_id         :integer
#  url                :string(255)
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
    self.url = title.downcase.gsub(/[^a-z\s]/, '').parameterize
  end

  def id
    lesson_id
  end

  def back_link
    project_path(url: project.url)
  end

  def first_lesson
    self == self.project.lessons.first
  end

end
