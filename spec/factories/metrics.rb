# == Schema Information
#
# Table name: metrics
#
#  model             :string(255)
#  title             :string(255)
#  method            :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  uid               :integer          not null, primary key
#  collection_method :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :metric do
  end
end
