# == Schema Information
#
# Table name: enrollments
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  university_id  :integer
#  field_of_study :string(255)
#  degree         :string(255)
#  start_date     :date
#  end_date       :date
#  created_at     :datetime
#  updated_at     :datetime
#  notes          :text
#  activities     :text
#

class Enrollment < ActiveRecord::Base
  belongs_to :user
  belongs_to :university
end
