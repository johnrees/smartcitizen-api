FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@domain.com" }
    password_digest "password1?"
  end
end
