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

