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

  delegate :name, to: :university, prefix: true, allow_nil: true

  # Formatting for the user profile page
  def enrollment_dates
    if start_date
      "#{start_date_formatted} - #{end_date_formatted}"
    end
  end

  def start_date_formatted
    start_date.month_and_year
  end

  def end_date_formatted
    end_date ? end_date.month_and_year : "Present"
  end

end

