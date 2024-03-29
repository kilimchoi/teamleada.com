# == Schema Information
#
# Table name: users
#
#  id                         :integer          not null, primary key
#  email                      :string(255)      default(""), not null
#  encrypted_password         :string(255)      default(""), not null
#  reset_password_token       :string(255)
#  reset_password_sent_at     :datetime
#  remember_created_at        :datetime
#  sign_in_count              :integer          default(0), not null
#  current_sign_in_at         :datetime
#  last_sign_in_at            :datetime
#  current_sign_in_ip         :string(255)
#  last_sign_in_ip            :string(255)
#  created_at                 :datetime
#  updated_at                 :datetime
#  username                   :string(255)
#  role                       :string(255)
#  confirmation_token         :string(255)
#  confirmed_at               :datetime
#  confirmation_sent_at       :datetime
#  first_name                 :string(255)
#  last_name                  :string(255)
#  unconfirmed_email          :string(255)
#  updated_password_at        :datetime
#  linkedin_id                :string(255)
#  name                       :string(255)
#  nickname                   :string(255)
#  linkedin_profile_image_url :string(255)      default("")
#  public_profile_url         :string(255)
#  has_project_access         :boolean          default(FALSE)
#  linkedin_confirmed_at      :datetime
#  linkedin_updated_at        :datetime
#

FactoryGirl.define do
  factory :user do
    first_name "Mark"
    last_name  "Awesome"
    email "mark@isawesome.com"
    username "markisawesome"

    factory :student do
      role "student"
    end

    factory :admin do
      role "admin"
    end

    factory :company do
      role "employee"
    end
  end
end
