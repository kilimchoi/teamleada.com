class UserFavoriteUserStory < Story

  def text
    "#{interactor.name} favorited #{interactee.name}"
  end

  def full_text
    "#{text} #{time_ago_in_words(created_at)}"
  end

end

