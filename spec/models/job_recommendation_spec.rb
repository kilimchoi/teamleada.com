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

require 'spec_helper'

describe JobRecommendation do
  pending "add some examples to (or delete) #{__FILE__}"
end
