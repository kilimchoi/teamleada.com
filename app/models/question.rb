class Question < ActiveRecord::Base
  serialize :voters, Array
  belongs_to :asker, class_name: User

  validates :title, presence: true

  default_scope -> { order("up_votes DESC, created_at ASC") }
  scope :top, -> (amount) { order("up_votes DESC, created_at ASC").first(amount) }
  scope :not_including_top, -> (amount) { order("up_votes DESC, created_at ASC").last((all.count < amount) ? 0 : all.count - amount) }

  def pretty_post_date
    created_at.strftime("%B %d, %Y")
  end

  def has_voted?(user, ip_address)
    unless user.nil?
      ip_address = user.current_sign_in_ip
    end

    voters.include? ip_address
  end

  # Methods
  def vote_from_user(user, ip_address)
    unless user.nil?
      ip_address = user.current_sign_in_ip
    end

    self.voters.push(ip_address)
    # Using up_votes as a pseudo counter cache for .voters
    self.up_votes += 1
  end

end
