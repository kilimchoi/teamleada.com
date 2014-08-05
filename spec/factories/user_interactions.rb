# == Schema Information
#
# Table name: user_interactions
#
#  id                 :integer          not null, primary key
#  company_id         :integer
#  interactor_id      :integer
#  interactee_id      :integer
#  favorited          :boolean          default(FALSE)
#  favorited_at       :datetime
#  contacted          :boolean          default(FALSE)
#  first_contacted_at :datetime
#  hired              :boolean          default(FALSE)
#  hired_at           :datetime
#  created_at         :datetime
#  updated_at         :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_interaction do
  end
end
