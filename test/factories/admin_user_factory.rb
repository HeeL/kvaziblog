FactoryGirl.define do
  factory :admin_user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password089'
  end
end