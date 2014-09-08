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

  before_create :set_company

  def set_company
    self.company = interactor.company
  end

  def set_favorited
    self.favorited = true
    self.favorited_at = Time.now
    self.set_company
    self.generate_favorited_story
  end

  def set_unfavorited
    self.favorited = false
    self.favorited_at = nil
    self.set_company
    self.generate_unfavorited_story
  end

  # Stories
  def generate_favorited_story
    # TODO(mark): Re-enable user favorite user stories
#    UserFavoriteUserStory.create(interactor: interactor, interactee: interactee, company: company, favorite: true)
  end

  def generate_unfavorited_story
#    UserFavoriteUserStory.create(interactor: interactor, interactee: interactee, company: company, favorite: false)
  end

end

