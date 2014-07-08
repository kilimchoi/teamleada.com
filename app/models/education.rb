class Education < ActiveRecord::Base
  belongs_to :user
  belongs_to :university
end
