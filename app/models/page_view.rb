class PageView < ActiveRecord::Base
  belongs_to :user
  belongs_to :viewed_user, class_name: User,
                           primary_key: :username

  serialize :parameters, Hash
  serialize :properties, Hash
end
