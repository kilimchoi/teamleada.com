# == Schema Information
#
# Table name: slides_link_submission_contents
#
#  id         :integer          not null, primary key
#  content    :text
#  link_type  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :slides_link_submission_content do
  end
end
