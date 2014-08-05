class Story < ActiveRecord::Base
  belongs_to :company
  belongs_to :interactor, class_name: User
  belongs_to :interactee, class_name: User

  include ActionView::Helpers::DateHelper

  self.inheritance_column = :type

  default_scope -> { order("created_at DESC") }
  scope :user_favorite_user_stories, -> { where(type: 'UserFavoriteUserStory') }

  def text
    raise "Abstract Method must override"
  end

  def full_text
    raise "Abstract Method must override"
  end

end

