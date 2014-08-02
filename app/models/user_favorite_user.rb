class UserFavoriteUser < ActiveRecord::Base
  belongs_to :company
  belongs_to :favoriter, class_name: User
  belongs_to :favoritee, class_name: User
end
