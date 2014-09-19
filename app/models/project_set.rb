# == Schema Information
#
# Table name: project_sets
#
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  uid         :integer          not null, primary key
#

class ProjectSet < ActiveRecord::Base
  has_many :projects

  def first_part
    projects.first
  end

  def last_part
    projects.last
  end

end
