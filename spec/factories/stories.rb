# == Schema Information
#
# Table name: stories
#
#  id           :integer          not null, primary key
#  subject_id   :integer
#  subject_type :string(255)
#  object_id    :integer
#  object_type  :string(255)
#  type         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  data         :text
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :story do
  end
end
