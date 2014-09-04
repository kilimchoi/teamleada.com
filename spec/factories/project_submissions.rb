# == Schema Information
#
# Table name: project_submissions
#
#  id                     :integer          not null, primary key
#  project_id             :integer
#  user_id                :integer
#  created_at             :datetime
#  updated_at             :datetime
#  upload_file            :string(255)
#  required               :boolean          default(TRUE)
#  original_filename      :string(255)
#  upload_file_tmp        :string(255)
#  upload_file_processing :boolean          default(FALSE)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project_submission do
  end
end
