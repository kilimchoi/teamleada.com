# == Schema Information
#
# Table name: job_recommendations
#
#  id                   :integer          not null, primary key
#  reviewer_first_name  :string(255)
#  reviewer_last_name   :string(255)
#  reviewer_linkedin_id :string(255)
#  reviewee_id          :integer
#  recommendation_type  :string(255)
#  body                 :text
#  created_at           :datetime
#  updated_at           :datetime
#

class JobRecommendation < ActiveRecord::Base
  belongs_to :reviewee, class_name: User
end
