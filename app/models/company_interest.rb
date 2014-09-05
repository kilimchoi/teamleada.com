# == Schema Information
#
# Table name: company_interests
#
#  id         :integer          not null, primary key
#  company_id :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class CompanyInterest < ActiveRecord::Base
end
