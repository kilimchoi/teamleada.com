class JobRecommendation < ActiveRecord::Base
  belongs_to :reviewee, class_name: User
end
