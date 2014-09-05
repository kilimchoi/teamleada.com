# == Schema Information
#
# Table name: browsable_users
#
#  id         :integer          not null, primary key
#  company_id :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class BrowsableUser < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
end
