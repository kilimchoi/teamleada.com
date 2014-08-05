class UserFavoriteUserStory < Story

  def favorited_or_unfavorited
    favorite ? "favorited" : "unfavorited"
  end

  def text
    "#{interactor.name} #{favorited_or_unfavorited} #{interactee.name}"
  end

  def full_text
    "#{text} #{time_ago_in_words(created_at)} ago"
  end

end

