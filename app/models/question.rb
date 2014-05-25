class Question < ActiveRecord::Base
  belongs_to :asker, class_name: User

  default_scope -> { order(:up_votes) }

  def pretty_post_date
    created_at.strftime("%B %d, %Y")
  end

end
