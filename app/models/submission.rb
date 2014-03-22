class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  default_scope order('score DESC')
end
