require 'faker'
I18n.reload!
FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| Faker::Internet.safe_email("person#{n}") }
    name  Faker::Name.last_name
    password Faker::Internet.password(10, 20)
  end
end
