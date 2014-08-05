class Story < ActiveRecord::Base
  belongs_to :company
  belongs_to :interactor
  belongs_to :interactee

  self.inheritance_column = :type

  scope :user_favorite_user_stories, -> { where(type: 'UserFavoriteUserStory') }

  def text
    raise "Abstract Method must override"
  end

  def full_text
    raise "Abstract Method must override"
  end

end

