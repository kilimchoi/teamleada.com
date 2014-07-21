# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  description :text
#  up_votes    :integer          default(0)
#  created_at  :datetime
#  updated_at  :datetime
#  asker_id    :integer
#  voters      :text
#  hidden      :boolean          default(FALSE)
#  title       :text
#

class Question < ActiveRecord::Base
  serialize :voters, Array
  belongs_to :asker, class_name: User

  validates :title, presence: true

  default_scope -> { order("up_votes DESC, created_at ASC") }
  scope :top, -> (amount) { where(hidden: false).first(amount) }
  scope :not_including_top, -> (amount) { where(hidden: false).last((all.where(hidden: false).count < amount) ? 0 : all.where(hidden: false).count - amount) }

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

    unless self.has_voted? user, ip_address
      self.voters.push(ip_address)
      # Using up_votes as a pseudo counter cache for .voters
      self.up_votes += 1
    end
  end

end
