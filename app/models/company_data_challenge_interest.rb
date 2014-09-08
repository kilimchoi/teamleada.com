# == Schema Information
#
# Table name: company_data_challenge_interests
#
#  id         :integer          not null, primary key
#  company_id :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class CompanyDataChallengeInterest < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
end
