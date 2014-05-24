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
