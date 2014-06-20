class PageView < ActiveRecord::Base
  belongs_to :user

  serialize :parameters, Hash
  serialize :properties, Hash
end
