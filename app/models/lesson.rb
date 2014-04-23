class Lesson < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  serialize :content, Array

  belongs_to :project
  has_many :steps, dependent: :destroy

  has_one :next_lesson
  has_one :previous_lesson

  has_many :slides, as: :parent, dependent: :destroy

  before_create :set_url
  validates_uniqueness_of :title, scope: :project_id

  def set_url
    self.url = title.downcase.gsub(/[^a-z\s]/, '').parameterize
  end

  def back_link
    project_path(url: project.url)
  end

end
