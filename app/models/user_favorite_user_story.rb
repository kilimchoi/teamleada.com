# == Schema Information
#
# Table name: stories
#
#  id            :integer          not null, primary key
#  interactor_id :integer
#  interactee_id :integer
#  company_id    :integer
#  text          :text
#  created_at    :datetime
#  updated_at    :datetime
#  type          :string(255)
#  favorite      :boolean          default(TRUE)
#

class UserFavoriteUserStory < Story

  def favorited_or_unfavorited
    favorite ? "favorited" : "unfavorited"
  end

  def text
    "#{interactor.name} #{favorited_or_unfavorited} #{interactee.name}"
  end

  def action_text
    "#{favorited_or_unfavorited}"
  end

  def full_text
    "#{text} #{time_ago_in_words(created_at)} ago"
  end

end

