class ProjectStatus < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  # Chart methods
  def created_before_and_not_completed?(day)
    created_at <= day.date.tomorrow && !completed?
  end

  def created_before_and_completed?(day)
    created_at <= day.date.tomorrow && completed?
  end
end
