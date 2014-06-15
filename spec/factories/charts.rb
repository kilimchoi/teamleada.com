# == Schema Information
#
# Table name: charts
#
#  category     :string(255)
#  title        :string(255)
#  y_axis_label :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  uid          :integer          not null, primary key
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chart do
  end
end
