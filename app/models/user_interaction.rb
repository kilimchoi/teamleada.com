# == Schema Information
#
# Table name: user_interactions
#
#  id                 :integer          not null, primary key
#  company_id         :integer
#  interactor_id      :integer
#  interactee_id      :integer
#  favorited          :boolean          default(FALSE)
#  favorited_at       :datetime
#  contacted          :boolean          default(FALSE)
#  first_contacted_at :datetime
#  hired              :boolean          default(FALSE)
#  hired_at           :datetime
#  created_at         :datetime
#  updated_at         :datetime
#

class UserInteraction < ActiveRecord::Base
  belongs_to :company
  belongs_to :interactor, class_name: User
  belongs_to :interactee, class_name: User

  scope :sort_by_favorited_at, -> { order(:favorited_at) }

  def set_favorited
    self.favorited = true
    self.favorited_at = Time.now
  end

  def set_unfavorited
    self.favorited = false
    self.favorited_at = nil
  end

end

