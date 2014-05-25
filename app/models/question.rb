class Question < ActiveRecord::Base
  belongs_to :asker, class_name: User

  default_scope -> { order(:up_votes) }
end
