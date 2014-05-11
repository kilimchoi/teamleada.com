# == Schema Information
#
# Table name: user_codes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  code_id    :integer
#

class UserCode < ActiveRecord::Base
  belongs_to :user
  belongs_to :code
end
