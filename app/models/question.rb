class Question < ActiveRecord::Base
  serialize :voters, Array
  belongs_to :asker, class_name: User

  validates :title, presence: true

  default_scope -> { order("up_votes DESC") }

  def pretty_post_date
    created_at.strftime("%B %d, %Y")
  end

  def has_voted?(user)
    voters.include? user.current_sign_in_ip
  end

end
