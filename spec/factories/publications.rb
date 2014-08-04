# == Schema Information
#
# Table name: publications
#
#  id                      :integer          not null, primary key
#  user_id                 :integer
#  title                   :string(255)
#  description             :text
#  publication_date        :date
#  publisher               :string(255)
#  created_at              :datetime
#  updated_at              :datetime
#  linkedin_publication_id :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :publication do
    user nil
    title "MyString"
    description "MyText"
    publication_date "2014-07-08"
    publisher "MyString"
  end
end
