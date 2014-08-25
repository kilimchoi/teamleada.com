# == Schema Information
#
# Table name: universities
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  location           :string(255)
#  verified           :boolean          default(FALSE)
#  created_at         :datetime
#  updated_at         :datetime
#  linkedin_school_id :string(255)
#

class University < ActiveRecord::Base
  has_many :enrollments

  def self.find_by_university_params(params)
    University.find_by(name: params[:university_name])
  end

end

